class Likes < ApplicationRecord
    belongs_to :posts, :users
end