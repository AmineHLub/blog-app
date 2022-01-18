class Comments < ApplicationRecord
    belongs_to :posts, :users
end