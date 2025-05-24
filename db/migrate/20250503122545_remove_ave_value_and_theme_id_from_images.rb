class RemoveAveValueAndThemeIdFromImages < ActiveRecord::Migration[8.0]
  def change
    remove_column :images, :ave_value, :float
    remove_column :images, :theme_id, :integer
  end
end
