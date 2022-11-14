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

ActiveRecord::Schema[7.0].define(version: 2022_11_12_053006) do
  create_table "tweets", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tweets_on_user_id"
  end

  create_table "user_followings", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "following_id"
    t.boolean "is_following_favourite", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follower_id"], name: "index_user_followings_on_follower_id"
    t.index ["following_id"], name: "index_user_followings_on_following_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "tweets_count"
    t.integer "followers_count"
    t.integer "followings_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "tweets", "users"
  add_foreign_key "user_followings", "users", column: "follower_id"
  add_foreign_key "user_followings", "users", column: "following_id"
end
