class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader

  validates :nickname,  presence: true, uniqueness: true,
                        length: {maximum: 12}

  has_many :spots
  has_many :likes
  has_many :comments, dependent: :destroy
end
