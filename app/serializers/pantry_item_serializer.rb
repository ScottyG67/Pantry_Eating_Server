class PantryItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :ext_id, :image, :foodContentsLabel
  belongs_to :pantry_category
end
