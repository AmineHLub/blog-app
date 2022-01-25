class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: { greater_than_or_equal_to: 0 }
  belongs_to :user
  has_many :likes, dependent: :delete_all
  has_many :comments, dependent: :delete_all

  def update_post_counter
    user.increment!(:posts_counter)
  end

  def recent_comments
    comments.last(5)
  end
end
