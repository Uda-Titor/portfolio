class User < ApplicationRecord
  before_destroy :check_destroy
  before_update :check_update

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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
    throw :abort if User.where(admin: true).count == 1 && admin == true
  end

  def check_update
    throw :abort if User.where(admin: true).count == 1 && admin == false
  end
end
