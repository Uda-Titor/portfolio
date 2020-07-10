class Label < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 10 }

  has_many :labellings, dependent: :destroy
  has_many :tasks, through: :labellings
end
