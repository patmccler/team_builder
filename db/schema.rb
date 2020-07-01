# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_01_201757) do

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "unit_type"
  end

  create_table "roster_memberships", force: :cascade do |t|
    t.integer "roster_id"
    t.integer "unit_id"
    t.string "unit_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rosters", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "game_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_rosters_on_game_id"
  end

  create_table "team_fight_tactics_units", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "game_id"
  end

  create_table "team_memberships", force: :cascade do |t|
    t.integer "team_id"
    t.integer "unit_id"
    t.string "unit_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "roster_id", null: false
    t.integer "team_size"
    t.integer "user_id"
    t.index ["roster_id"], name: "index_teams_on_roster_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.boolean "admin", default: false
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "warcraft_units", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "game_id"
  end

  add_foreign_key "teams", "rosters"
end
