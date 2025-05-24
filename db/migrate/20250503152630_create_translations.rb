class CreateTranslations < ActiveRecord::Migration[8.0]
  def change
    create_table :translations do |t|
      t.string :locale
      t.string :key
      t.text :value

      t.timestamps
    end

    add_index :translations, [ :locale, :key ], unique: true
  end
end
