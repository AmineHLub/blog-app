class User < ApplicationRecord
  has_many :posts
  has_many :likes, through: :posts
  has_many :comments, through: :posts
  def last_recent_posts
    posts.last(3)
  end

  User.create(name: 'Jhon', photo: 'photo_url', bio: 'I am a developer', posts_counter: 2)
  User.create(name: 'Bella', photo: 'photo_url', bio: 'I am a teacher', posts_counter: 0)
  User.create(name: 'Kim', photo: 'photo_url', bio: 'I am a nurse', posts_counter: 1)
  User.create(name: 'Mohamed', photo: 'photo_url', bio: 'I am a technician', posts_counter: 4)
end
