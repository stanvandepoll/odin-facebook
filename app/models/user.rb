class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: %i[facebook]
         
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

  # commented out because it didn't work in production with heroku
  # after_create :send_welcome_email

  def send_welcome_email
    UserMailer.with(user: self).welcome_email.deliver_now
  end

  def send_request(other_user)
    request = self.outgoing_requests.new(requester_id: self.id, 
      receiver_id: other_user.id)
    request.save
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
end
