class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  def update_post_counter
    users.posts_counter += 1
  end

  def recent_comments
    comments.last(5)
  end
  
end
