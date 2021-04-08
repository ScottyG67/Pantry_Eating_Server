class RemovePantryCategoriesFromPantryItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :pantry_items, :pantry_categories_id, :references
  end
end
