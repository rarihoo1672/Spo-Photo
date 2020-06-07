class Spot < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: {maximum: 25}
  validates :main_visual, presence: true

  has_many :peripheries

  mount_uploader :main_visual, MainVisualUploader

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
