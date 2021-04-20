class UserPantryCategory < ApplicationRecord
  belongs_to :user
  belongs_to :pantry_category
end
