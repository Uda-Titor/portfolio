class ChangeStatusColumnMatter < ActiveRecord::Migration[5.2]
  def up
    change_column :matters, :status, :string, default: "未着手"
  end

  def down
    change_column :matters, :status, :string
  end
end
