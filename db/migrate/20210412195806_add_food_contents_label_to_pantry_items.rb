class AddFoodContentsLabelToPantryItems < ActiveRecord::Migration[6.1]
  def change
    add_column :pantry_items, :foodContentsLabel, :string
  end
end
