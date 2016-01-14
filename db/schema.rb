# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160111224644) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "user_id"
    t.string   "drink_id"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments_favorites", force: :cascade do |t|
    t.integer  "comment_id"
    t.integer  "favorite_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "comments_favorites", ["comment_id"], name: "index_comments_favorites_on_comment_id", using: :btree
  add_index "comments_favorites", ["favorite_id"], name: "index_comments_favorites_on_favorite_id", using: :btree

  create_table "favorites", force: :cascade do |t|
    t.string   "drink_id"
    t.string   "description"
    t.string   "img"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

<<<<<<< Updated upstream
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

=======
>>>>>>> Stashed changes
  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "comments_favorites", "comments"
  add_foreign_key "comments_favorites", "favorites"
<<<<<<< Updated upstream
  add_foreign_key "favorites", "users"
=======
>>>>>>> Stashed changes
end
