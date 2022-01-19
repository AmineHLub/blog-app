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

  User.create(name: 'Jhon', photo: 'Link to a photo', bio: 'I am a developer', posts_counter: 0)
  User.create(name: 'Bella', photo: 'Link to a photo', bio: 'I am a teacher', posts_counter: 0)
  User.create(name: 'Kim', photo: 'Link to a photo', bio: 'I am a nurse', posts_counter: 0)
  User.create(name: 'Mohamed', photo: 'Link to a photo', bio: 'I am a technician', posts_counter: 0)
end
