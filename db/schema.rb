# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171026060306) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "founds", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "points"
    t.bigint "game_location_id"
    t.index ["game_location_id"], name: "index_founds_on_game_location_id"
    t.index ["user_id"], name: "index_founds_on_user_id"
  end

  create_table "game_locations", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_locations_on_game_id"
    t.index ["location_id"], name: "index_game_locations_on_location_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image"
    t.decimal "lat"
    t.decimal "long"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.text "description"
  end

  add_foreign_key "founds", "game_locations"
  add_foreign_key "founds", "users"
  add_foreign_key "game_locations", "games"
  add_foreign_key "game_locations", "locations"
end
