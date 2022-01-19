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

  Post.create(title: 'Post of Jhon', likes_counter: 1, comments_counter: 1, user_id: 1, text: 'this is a post by john')
  Post.create(title: 'Post of Bella', likes_counter: 5, comments_counter: 7, user_id: 2, text: 'this is a post by bella')
  Post.create(title: 'Post of Kim', likes_counter: 7, comments_counter: 2, user_id: 3, text: 'this is a post by kim')
  Post.create(title: 'Post of Mohamed', likes_counter: 9, comments_counter: 0, user_id: 4, text: 'this is a post by mohamed')
end
