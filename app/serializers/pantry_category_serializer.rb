class PantryCategorySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :pantry_items
end
