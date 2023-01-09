class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  validates :body, presence: true
  validates :post_type, presence:true
end
