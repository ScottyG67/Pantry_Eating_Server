# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
UserPantryCategory.destroy_all
User.destroy_all
PantryCategory.destroy_all
PantryItem.destroy_all

user1 = User.create(username: "Swedish Chef", email:"swedish@chef.com", password: "password")

category0 = PantryCategory.create(name: "None")
category1 = PantryCategory.create(name: "Freezer")
category2 = PantryCategory.create(name: "Fridge")
category3 = PantryCategory.create(name: "Fruit/Veggie")
category4 = PantryCategory.create(name: "Meat")
category5 = PantryCategory.create(name: "Packaged")

category_list = [category0,category1,category2,category3,category4,category5]
user_list = [user1]

user_list.each do |user|
    category_list.each do |category|
        join = UserPantryCategory.new
        join.user = user
        join.pantry_category = category
        join.save
    end
end


item2 = PantryItem.create(name:"Peanut Butter", description: "Creamy", upc: "051500720011", user: user1, pantry_category: category5)