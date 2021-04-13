class AddImageToPantryItems < ActiveRecord::Migration[6.1]
  def change
    add_column :pantry_items, :image, :string
  end
end
