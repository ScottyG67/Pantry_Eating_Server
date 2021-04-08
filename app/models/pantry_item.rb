class PantryItem < ApplicationRecord
  belongs_to :user
  belongs_to :pantry_category
end
