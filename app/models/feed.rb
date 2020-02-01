class Feed < ApplicationRecord
  validates :message, presence: true, if: -> {image.blank?}
  validates :image, presence: true, if: -> {message.blank?}

  mount_uploader :image, ImageUploader
  
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
