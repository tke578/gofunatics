class FavoritesController < ApplicationController
  def new
  end

  def create

  	@interest = Interest.find(params[:interest_id])
  	@user = User.find(current_user.id)
	respond_to do |format|
      if @user.interests << [@interest]
  		get_interests_and_favorites
	    format.html
	    format.js { render 'users/show' }
	  else
	  	format.html
	    format.js { render 'users/show_error' }
	  end
	end
  end

  def destroy
	respond_to do | format |
  	  if User.find(current_user.id).interests.destroy(Interest.find(params[:interest_id]))
  		get_interests_and_favorites
		format.html
	    format.js { render 'users/show' }
	   else
	  	format.html
	    format.js { render 'users/show_error' }
	  end
	end
  end

  private

  	def get_interests_and_favorites
  		@user = User.find(current_user.id)
  		@favorites = @user.interests.order('name ASC')
	    e = @user.user_interests.pluck(:interest_id)
	    arr = e.join(",")
	    @interests = Interest.where("id not in (#{arr})").order('name ASC')
  	end
    # Never trust parameters from the scary internet, only allow the white list through.
    def favorite_params
      params.require(:favorite).permit(:interest_id, :user_id)
    end
end
