class Matter < ApplicationRecord
  enum priority: { 高: 0, 中: 1, 低: 2 }
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy
  #画像アップロード
  has_many_attached :images

  def favorited_by?(user)
    favorites.where(user_id: user.id).present?
  end
end
