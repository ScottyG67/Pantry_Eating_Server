class PantryItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :ext_id, :image, :foodContentsLabel, :pantry_category_id
  belongs_to :pantry_category
end
