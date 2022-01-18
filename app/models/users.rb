class Users < ApplicationRecord
    has_many :posts 
    has_many :likes, through: :posts           
    has_many :comments, through: :posts    
    def last_recent_posts
    posts.last(3)
    end
end