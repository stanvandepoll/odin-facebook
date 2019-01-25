class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :friend_requests, dependent: :destroy, foreign_key: "requester_id"
  has_many :pending_friends, through: :friend_requests, source: :receiver
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :likes
  has_many :comments
  has_many :posts

  def send_request(other_user)
    request = self.friend_requests.new(requester_id: self.id, 
      receiver_id: other_user.id)
    request.save
  end
end
