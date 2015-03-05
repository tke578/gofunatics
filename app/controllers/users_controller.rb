class UsersController < ApplicationController
  def index
    # @users = User.all <-- this was a security hole that displayed all user emails, etc.
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      sign_in @user
      redirect_to user_path(@user), notice: 'User was successfully created.'
    else
      render action: 'new'
    end
  end
  
  def show
    set_user
	# user must be logged in to go to favorites page (users/show view)....
	if (defined?(current_user.id)).nil?
	  redirect_to root_path
	end
    @favorites = @user.interests
    e = @user.user_interests.pluck(:interest_id)
    arr = e.join(",")
    @interests = Interest.where("id not in (#{arr})").order('name ASC')
  end

  def edit
    set_user
  end

  def update
    set_user

    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end

  end

  def destroy    
    if set_user.destroy
      redirect_to users_path, notice: 'User deleted.'
    else
      render action: 'index'
    end
  end

  private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit([:first_name, :last_name, :email_address, :password, :password_confirmation, :address, :city, :state, :zip_code])
    end
end
