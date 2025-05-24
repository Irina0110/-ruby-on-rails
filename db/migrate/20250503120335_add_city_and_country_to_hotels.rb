class AddCityAndCountryToHotels < ActiveRecord::Migration[8.0]
  def change
    add_reference :hotels, :city, foreign_key: true
    add_reference :hotels, :country, foreign_key: true
  end
end
