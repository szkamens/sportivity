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

ActiveRecord::Schema.define(version: 2020_05_25_121402) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "player_limit"
    t.string "location"
    t.string "skill_level"
    t.text "description"
    t.boolean "cancelled", default: false
    t.bigint "user_id", null: false
    t.bigint "sport_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sport_id"], name: "index_activities_on_sport_id"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "players", force: :cascade do |t|
    t.datetime "accepted_at"
    t.boolean "invitation"
    t.bigint "activity_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_players_on_activity_id"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "sport_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "sport_id", null: false
    t.string "skill_level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sport_id"], name: "index_sport_users_on_sport_id"
    t.index ["user_id"], name: "index_sport_users_on_user_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.string "gender"
    t.text "description"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "sports"
  add_foreign_key "activities", "users"
  add_foreign_key "players", "activities"
  add_foreign_key "players", "users"
  add_foreign_key "sport_users", "sports"
  add_foreign_key "sport_users", "users"
end
