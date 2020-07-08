class ChangeColumnAddNotnullOnMatters < ActiveRecord::Migration[5.2]
  def change
    change_column_null :matters, :title, false
    change_column_null :matters, :content, false
  end
end
