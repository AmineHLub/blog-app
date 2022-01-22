class User < ApplicationRecord
  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }
  has_many :posts
  has_many :likes, through: :posts
  has_many :comments, through: :posts

  def last_recent_posts
    posts.includes(:comments).last(3)
  end
end
