class PostsController < ApplicationController
  def index
    @posts = Post.all
    redirect_to event_path
  end

  def create
    @post = Event.find(params[:event_id]).posts.new(post_params)
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to event_path(params[:event_id]) }
        format.js { render 'create' }
        # format.json { render action: 'show', status: :created, location: products_path }
      else
        format.html { render action: 'new' }
        # format.json { render json: products_path.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @event = Event.find(params[:event_id])
    @post = Post.new
  end

  def show
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:event_id, :user_id, :content)
    end
end
