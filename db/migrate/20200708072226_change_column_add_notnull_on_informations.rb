class ChangeColumnAddNotnullOnInformations < ActiveRecord::Migration[5.2]
  def change
    change_column_null :information, :content, false
  end
end
