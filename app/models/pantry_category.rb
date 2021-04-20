class PantryCategory < ApplicationRecord
    has_many :pantry_items, dependent: :destroy
    has_many :user_pantry_categories, dependent: :destroy
    has_many :users, through: :user_pantry_categories
end
