class Notification < ApplicationRecord
  validates :visitor_id, presence: true
  validates :visited_id, presence: true
  validates :matter_id, presence: true
  validates :action, presence: true
  validates :checked, inclusion: [true, false]
  validates :admin_checked, inclusion: [true, false]

  default_scope -> { order(created_at: :desc) }
  belongs_to :matter, optional: true
  belongs_to :comment, optional: true

  belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true

  # バッチ処理
  def self.delete_check
    Notification.all.each do |notification|
      notification.destroy if notification.checked == true && notification.admin_checked == true
    end
  end
end
