class UsersController < ApplicationController
  def index
    @users = User.all.order(created_at: :asc)
  end

  def show
    @user = current_user
    @posts = @user.last_recent_posts
  end
end
