class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :photos, dependent: :destroy
  has_many :comments
  has_many :friendships
  has_many :received_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :active_friends, -> { where(friendships: { accepted: true}) }, through: :friendships, source: :friend
	has_many :received_friends, -> { where(friendships: { accepted: true}) }, through: :received_friendships, source: :user
	has_many :pending_friends, -> { where(friendships: { accepted: false}) }, through: :friendships, source: :friend
	has_many :requested_friendships, -> { where(friendships: { accepted: false}) }, through: :received_friendships, source: :user

  def display_name
    username.present? ? username : email
  end

  def friends
	  active_friends | received_friends
  end
  
  def pending
		pending_friends | requested_friendships
	end
end
