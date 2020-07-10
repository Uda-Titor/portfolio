class ChangeColumnAddNotnullOnComments < ActiveRecord::Migration[5.2]
  def change
    change_column_null :comments, :matter_id, false
    change_column_null :comments, :content, false
  end
end
