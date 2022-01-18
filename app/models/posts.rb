class Posts < ApplicationRecord      
    belongs_to :user
    has_many :likes, :comments
end