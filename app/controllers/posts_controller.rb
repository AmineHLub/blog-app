class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @like = Like.where(user_id: current_user.id, post_id: params[:id]).exists?
  end

  def new
    @post = Post.new
  end

  def create
    new_post = current_user.posts.new(post_params)
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

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    current_user.posts_counter -= 1
    current_user.save
    redirect_to("/users/#{current_user.id}")
    flash[:success] = 'Post was destroyed!'
  end

  private

  def post_params
    params.require(:data).permit(:title, :text)
  end
end
