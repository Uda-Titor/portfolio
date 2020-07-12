class RenameUserAddressColumnToUserPlace < ActiveRecord::Migration[5.2]
  def up
    rename_column :users, :user_place, :user_place
  end

  def down
    rename_column :users, :user_place, :user_place
  end
end
