class AddColumnMatters < ActiveRecord::Migration[5.2]
  def up
    add_column :matters, :mail_status, :string, default: '未送信'
    add_column :matters, :send_email, :boolean, default: false
  end

  def down
    add_column :matters, :mail_status, :string, default: '未送信'
    add_column :matters, :send_email, :boolean, default: false 
  end
end
