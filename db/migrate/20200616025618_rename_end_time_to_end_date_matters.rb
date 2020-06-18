class RenameStartTimeAndEndTimeToStartDateAndEndDateMatters < ActiveRecord::Migration[5.2]
  def change
    rename_column :matters, :end_date, :end_time
  end
end
