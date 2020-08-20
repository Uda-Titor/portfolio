class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :phone_number, :string, default: "00000000000"
  end

  # 変更前の状態
  def down
    change_column :users, :phone_number, :string
  end
end
