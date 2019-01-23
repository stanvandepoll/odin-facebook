class User < ApplicationRecord
  has_many :friend_requests, dependent: :destroy, foreign_key: "requester_id"
  has_many :pending_friends, through: :friend_requests, source: :receiver
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :likes
  has_many :comments
  has_many :posts
end
