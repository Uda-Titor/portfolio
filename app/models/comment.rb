class Comment < ApplicationRecord
  validates :content, presence: true

  belongs_to :matter
  belongs_to :user

  has_many :notifications, dependent: :destroy
end
