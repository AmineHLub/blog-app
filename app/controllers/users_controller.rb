class UsersController < ApplicationController
  def index
    @users = User.all.order(created_at: :asc)
    @current_user = current_user
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.last_recent_posts
  end
end
