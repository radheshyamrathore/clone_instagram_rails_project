class User < ApplicationRecord
    has_many :posts
    has_many :comments,through: :posts
    has_many :likes,through: :posts
    validates :user_name,uniqueness: true
    validates :user_age, numericality: true
end

