class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
  def update_likes_count
    posts.likes_counter += 1
  end
end
