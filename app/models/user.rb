class User < ApplicationRecord
    has_secure_password
    has_many :posts
    has_many :comments,through: :posts
    has_many :likes,through: :posts
    validates :user_name, presence: true
    validates :user_age, numericality: true
    validates :password_digest, presence: true
end

