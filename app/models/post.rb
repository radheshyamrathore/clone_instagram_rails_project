class Post < ApplicationRecord
  belongs_to :user
  before_save :set_user
  has_one_attached :video
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :likes
  enum post_type:[:image,:video]

  def set_user
    user = User.pluck(:name).last
    self.author_user =  user
end
end 