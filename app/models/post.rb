# frozen_string_literal: true
class Post < ApplicationRecord # rubocop:disable Style/Documentation
  belongs_to :user
  # after_save :set_user
  has_one_attached :video
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :likes
  enum post_type: %i[image video]

end
