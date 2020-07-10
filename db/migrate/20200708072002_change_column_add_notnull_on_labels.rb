class ChangeColumnAddNotnullOnLabels < ActiveRecord::Migration[5.2]
  def change
    change_column_null :labels, :name, false
  end
end
