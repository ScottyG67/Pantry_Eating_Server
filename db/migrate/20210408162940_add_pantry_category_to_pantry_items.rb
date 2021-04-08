class AddPantryCategoryToPantryItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :pantry_items, :pantry_category, null: true, foreign_key: true
  end
end
