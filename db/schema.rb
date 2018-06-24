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

ActiveRecord::Schema.define(version: 20180624143245) do

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "nazo_id"
    t.integer "likes_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nazos", force: :cascade do |t|
    t.text "content"
    t.string "answer"
    t.integer "difficulty"
    t.integer "good_num"
    t.integer "fight_num"
    t.integer "solved_num"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at", "good_num"], name: "index_nazos_on_user_id_and_created_at_and_good_num"
    t.index ["user_id"], name: "index_nazos_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "nazo_id"
    t.boolean "ac"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["nazo_id"], name: "index_relationships_on_nazo_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "login_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
    t.integer "fighted_num", default: 0
    t.integer "solved_num", default: 0
    t.integer "ac_sum", default: 0
    t.integer "like_sum", default: 0
    t.index ["login_id"], name: "index_users_on_login_id", unique: true
  end

end
