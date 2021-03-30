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

ActiveRecord::Schema.define(version: 2021_03_30_073517) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.date "date"
    t.string "opponent_name"
    t.integer "score_my"
    t.integer "score_opponent"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "grampus_players", force: :cascade do |t|
    t.string "name"
    t.integer "player_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "game1", default: 0
    t.integer "game2", default: 0
    t.integer "game3", default: 0
    t.integer "game4", default: 0
    t.integer "game5", default: 0
    t.index ["player_id"], name: "index_grampus_players_on_player_id", unique: true
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "score"
    t.bigint "user_id", null: false
    t.bigint "game_id", null: false
    t.bigint "grampus_player_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_reviews_on_game_id"
    t.index ["grampus_player_id", "created_at"], name: "index_reviews_on_grampus_player_id_and_created_at"
    t.index ["grampus_player_id"], name: "index_reviews_on_grampus_player_id"
    t.index ["user_id", "game_id", "grampus_player_id"], name: "index_reviews_on_user_id_and_game_id_and_grampus_player_id", unique: true
    t.index ["user_id", "game_id"], name: "index_reviews_on_user_id_and_game_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "reviews", "games"
  add_foreign_key "reviews", "grampus_players"
  add_foreign_key "reviews", "users"
end
