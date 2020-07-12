class ChangeColumnAddNotnullOnLabellings < ActiveRecord::Migration[5.2]
  def change
    change_column_null :labellings, :matter_id, false
    change_column_null :labellings, :label_id, false
  end
end
