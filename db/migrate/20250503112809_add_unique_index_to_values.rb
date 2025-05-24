class AddUniqueIndexToValues < ActiveRecord::Migration[8.0]
  def change
    add_index :values, [ :user_id, :hotel_id ], unique: true
  end
end
