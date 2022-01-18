class Posts < ApplicationRecord
  belongs_to :users
  has_many :likes, :comments

  def update_post_counter
    users.posts_counter += 1
  end

  def recent_comments
    comments.last(5)
  end
end
