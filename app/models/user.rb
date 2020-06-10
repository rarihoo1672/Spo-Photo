class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  has_many        :spots
  has_many        :comments,     dependent: :destroy
  has_many        :likes,        dependent: :destroy
  has_many        :liked_spots, through: :likes, source: :spot

  validates       :nickname,     presence: true,  uniqueness: true, 
                  length: { minimum: 1, maximum: 12 }
  validates       :introduction, length: { maximum: 1000 }

  mount_uploader  :avatar, AvatarUploader

  def already_liked?(spot)
    self.likes.exists?(spot_id: spot.id)
  end
end
