class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader

  validates :nickname,  presence: true, uniqueness: true,
                        length: {maximum: 12}

  has_many :spots
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_spotss, through: :likes, source: :spot
  def already_liked?(spot)
    self.likes.exists?(spot_id: spot.id)
  end
end
