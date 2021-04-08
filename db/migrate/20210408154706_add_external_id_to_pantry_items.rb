class AddExternalIdToPantryItems < ActiveRecord::Migration[6.1]
  def change
    add_column :pantry_items, :ext_id, :string
  end
end
