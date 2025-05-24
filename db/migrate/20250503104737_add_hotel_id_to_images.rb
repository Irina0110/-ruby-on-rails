class AddHotelIdToImages < ActiveRecord::Migration[6.0]
  def change
    add_column :images, :hotel_id, :integer
    add_index :images, :hotel_id
  end
end
