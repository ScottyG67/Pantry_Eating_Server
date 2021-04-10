class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: { case_sensitive: false }

    has_many :pantry_items, dependent: :destroy
    has_many :recipes, dependent: :destroy

    
end
