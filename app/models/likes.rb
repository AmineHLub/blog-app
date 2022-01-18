class Likes < ApplicationRecord
  belongs_to :posts, :users

  def update_likes_count
    posts.likes_counter += 1
  end
end
