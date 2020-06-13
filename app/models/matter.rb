class Matter < ApplicationRecord
  enum priority: { 高: 0, 中: 1, 低: 2 }
  belongs_to :user
  #画像アップロード
  has_many_attached :images
end
