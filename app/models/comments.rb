class Comments < ApplicationRecord
  belongs_to :posts, :users

  def update_commment_count
    posts.comments_counter += 1
  end
end
