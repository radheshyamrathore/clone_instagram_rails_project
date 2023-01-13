class Post < ApplicationRecord
  belongs_to :user
  #has_one_attached :video
  #has_one_attached :image
  has_many :comments
  has_many :likes
  enum post_type:[:image,:video]
end
