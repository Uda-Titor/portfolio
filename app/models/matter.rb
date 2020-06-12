class Matter < ApplicationRecord
  enum priority: { 高: 0, 中: 1, 低: 2 }
  belongs_to :user
end
