class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
  	user = User.authenticate(params[:session][:email_address], params[:session][:password])

  	if user.nil?
  		flash.now[:error] = "Invalid email/password combination."
  		render :new
  	else
  		sign_in user
  		redirect_to user_path(user)
      # render text: user
  	end

  end

  def destroy
  	sign_out
    redirect_to interests_path, notice: "You are now logged out."
  end

end
