class Spot < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: {maximum: 25}
  
  validates :main_visual, presence: true, length: {minimum: 1}
  mount_uploader :main_visual, MainVisualUploader

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  has_many :likes
  has_many :liked_users, through: :likes, source: :user
end
