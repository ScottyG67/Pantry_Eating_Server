class CreateUserPantryCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :user_pantry_categories do |t|
      t.references :user, null: false, foreign_key: true
      t.references :pantry_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
