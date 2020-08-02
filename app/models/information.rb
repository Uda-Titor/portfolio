class Information < ApplicationRecord
  validates :content, presence: true
  scope :latest, -> {all.order(created_at: :asc)}
end
