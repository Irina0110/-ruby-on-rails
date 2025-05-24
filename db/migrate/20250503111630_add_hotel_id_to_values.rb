class AddHotelIdToValues < ActiveRecord::Migration[6.0]
  def change
    add_column :values, :hotel_id, :integer
    add_index :values, :hotel_id
  end
end
