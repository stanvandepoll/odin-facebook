class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :outgoing_requests, dependent: :destroy, class_name: "FriendRequest",
    foreign_key: "requester_id"
  has_many :incoming_requests, dependent: :destroy, class_name: "FriendRequest",
    foreign_key: "receiver_id"
  has_many :pending_friends, through: :outgoing_requests, source: :receiver
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :likes
  has_many :comments
  has_many :posts

  def send_request(other_user)
    request = self.outgoing_requests.new(requester_id: self.id, 
      receiver_id: other_user.id)
    request.save
  end
end
