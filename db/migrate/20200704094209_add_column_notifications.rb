class AddColumnNotifications < ActiveRecord::Migration[5.2]
  def up
    add_column :notifications, :admin_checked, :boolean, default: false, null: false
  end

  def down
    remove_column :notifications, :admin_checked, :boolean, default: false, null: false
  end
end
