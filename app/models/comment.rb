class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def update_commment_count
    posts.comments_counter += 1
  end
end
