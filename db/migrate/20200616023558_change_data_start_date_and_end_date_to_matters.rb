class ChangeDataStartDateAndEndDateToMatters < ActiveRecord::Migration[5.2]
  def change
    change_column :matters, :start_time, :datetime
    change_column :matters, :end_time, :datetime
  end
end
