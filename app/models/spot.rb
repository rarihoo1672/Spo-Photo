class Spot < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: {maximum: 25}
  validates :main_visual, presence: true

  mount_uploader :main_visual, MainVisualUploader
end
