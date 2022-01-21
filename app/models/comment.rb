class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def update_commment_count
    post.increment!(:comments_counter)
  end
end
