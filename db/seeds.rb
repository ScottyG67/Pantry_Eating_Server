# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
PantryCategory.destroy_all
PantryItem.destroy_all

user1 = User.create(username: "Swedish Chef", email:"swedish@chef.com", password: "password")
user2 = User.create(username: "Sgloyna", email:"scott.gloyna01@gmail.com", password: "password")

category0 = PantryCategory.create(name: "None")
category1 = PantryCategory.create(name: "Freezer")
category2 = PantryCategory.create(name: "Fridge")
category3 = PantryCategory.create(name: "Fruit/Veggie")
category4 = PantryCategory.create(name: "Meat")
category5 = PantryCategory.create(name: "Packaged")

item2 = PantryItem.create(name:"Peanut Butter", description: "Creamy", upc: "051500720011", user: user1, pantry_category: category5)