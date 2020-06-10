class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :spot

  validates :content, presence: true, length: { minimum: 1, maximum: 30 } 
end
