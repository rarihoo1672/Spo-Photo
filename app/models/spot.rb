class Spot < ApplicationRecord
  belongs_to       :user
  has_many         :comments,     dependent: :destroy
  has_many         :likes,        dependent: :destroy
  has_many         :liked_users,  through: :likes, source: :user

  validates        :name,         presence: true, length: {maximum: 25}
  validates        :information,  length: { maximum: 1000 }
  validates        :address,      presence: true
  validates        :main_visual,  presence: true
  mount_uploader   :main_visual,  MainVisualUploader

  geocoded_by      :address
  after_validation :geocode,      if: :address_changed?
end
