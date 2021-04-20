class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: { case_sensitive: false }

    has_many :pantry_items, dependent: :destroy
    has_many :recipes, dependent: :destroy
    has_many :user_pantry_categories, dependent: :destroy
    has_many :pantry_categories, through: :user_pantry_categories

    
end
