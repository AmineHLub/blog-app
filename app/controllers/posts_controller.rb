class PostsController < ApplicationController
  def index
    @user = User.includes(:posts).find_by(id: params[:user_id])
    @posts = Post.where('user_id = ?', @user.id)
  end

  def show; end
end
