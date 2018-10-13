class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true
  validates :username, presence: true
  validates :avatar, presence: true

  has_one_attached :avatar
  has_many :photos, dependent: :destroy
  has_many :comments
  has_many :following_relationships, class_name: "Relationship", foreign_key: "follower_id"
  has_many :following, through: :following_relationships, source: :followed
  has_many :followed_relationships, class_name: "Relationship", foreign_key: "followed_id"
  has_many :followers, through: :followed_relationships, source: :follower
	
  def display_name
    username.present? ? username : email
  end

  def follow(friend)
    following << friend
  end

  def unfollow(friend)
    following.delete(friend)
  end

  def following?(friend)
    following.include?(friend)
  end
end
