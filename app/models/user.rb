class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :email, presence: true
  #管理者がいなくならないようにコールバック
  before_destroy :check_destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :matters, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  #通知機能
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  mount_uploader :user_image, ImageUploader
  #user編集時にcurrent_passwordを入れないようにする処理関係
  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  private
  def check_destroy
    throw :abort if User.where(admin: true).count == 1 && self.admin == true
  end

end
