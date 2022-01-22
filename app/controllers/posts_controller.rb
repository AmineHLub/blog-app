class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @like = current_user.likes.where(post_id: params[:id]).exists?
  end

  def new
    @current_user = current_user
  end

  def create
    new_post = current_user.posts.new(params.require(:data).permit(:title, :text))
    new_post.likes_counter = 0
    new_post.comments_counter = 0
    new_post.update_post_counter
    respond_to do |format|
      format.html do
        if new_post.save
          redirect_to "/users/#{new_post.user.id}/posts/", notice: 'Success!'
        else
          render :new, alert: 'Error occured!'
        end
      end
    end
  end
end
