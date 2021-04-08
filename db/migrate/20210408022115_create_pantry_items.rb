class CreatePantryItems < ActiveRecord::Migration[6.1]
  def change
    create_table :pantry_items do |t|
      t.references :user, null: false, foreign_key: true
      t.references :pantry_categories, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.string :upc

      t.timestamps
    end
  end
end
