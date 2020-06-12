class AddUserRefToMatters < ActiveRecord::Migration[5.2]
  def change
    add_reference :matters, :user, foreign_key: true
  end
end
