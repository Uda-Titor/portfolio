class AddLatestSenderToMatters < ActiveRecord::Migration[5.2]
  def change
    add_column :matters, :latest_sender, :string
  end
end
