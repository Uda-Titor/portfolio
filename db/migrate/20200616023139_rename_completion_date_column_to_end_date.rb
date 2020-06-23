class RenameCompletionDateColumnToEndDate < ActiveRecord::Migration[5.2]
  def change
    rename_column :matters, :end_time, :end_date
  end
end
