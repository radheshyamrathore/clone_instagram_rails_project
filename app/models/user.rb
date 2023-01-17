# frozen_string_literal: true
class User < ApplicationRecord # rubocop:disable Style/Documentation
  has_secure_password
  has_many :posts
  # has_many :comments, through: :posts
  has_many :likes, through: :posts
end
