class Photo < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image

  validates :user_id, presence: true  
  validates :image, presence: true
end
