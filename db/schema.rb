# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_08_022115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pantry_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pantry_items", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "pantry_categories_id", null: false
    t.string "name"
    t.text "description"
    t.string "upc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pantry_categories_id"], name: "index_pantry_items_on_pantry_categories_id"
    t.index ["user_id"], name: "index_pantry_items_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "pantry_items", "pantry_categories", column: "pantry_categories_id"
  add_foreign_key "pantry_items", "users"
end
