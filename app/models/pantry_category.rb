class PantryCategory < ApplicationRecord
    has_many :pantry_items, dependent: :destroy
end
