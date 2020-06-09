class CreateMatters < ActiveRecord::Migration[5.2]
  def change
    create_table :matters do |t|
      t.string :title
      t.text :content
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :status
      t.integer :priority
      t.date :start_date
      t.date :completion_date
      t.text :remark

      t.timestamps
    end
  end
end
