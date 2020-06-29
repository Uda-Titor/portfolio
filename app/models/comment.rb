class Comment < ApplicationRecord
  belongs_to :matter
  belongs_to :user

  has_many :notifications, dependent: :destroy
end
