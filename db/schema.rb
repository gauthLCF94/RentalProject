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

ActiveRecord::Schema.define(version: 2021_01_29_000353) do

  create_table "appartements", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.text "description"
    t.string "address"
    t.integer "postcode"
    t.string "city"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_appartements_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "contenu"
    t.integer "user_id", null: false
    t.integer "appartement_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["appartement_id"], name: "index_messages_on_appartement_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  add_foreign_key "appartements", "users"
  add_foreign_key "messages", "appartements"
  add_foreign_key "messages", "users"
end
