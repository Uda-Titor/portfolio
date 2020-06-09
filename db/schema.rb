
ActiveRecord::Schema.define(version: 2020_06_09_015224) do
>>>>>>> issues#2

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "matters", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "status"
    t.integer "priority"
    t.date "start_date"
    t.date "completion_date"
    t.text "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end


end
