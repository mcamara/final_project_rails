class Photo < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_one_attached :image
end
