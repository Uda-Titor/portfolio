class RemoveTitleandAddressFromMatters < ActiveRecord::Migration[5.2]
  def up
    remove_column :matters, :title, :string
    remove_column :matters, :address, :string
  end

  def down
    add_column :matters, :title, :string
    add_column :matters, :address, :string
  end
end
