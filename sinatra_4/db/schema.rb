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

ActiveRecord::Schema.define(version: 20160420103725) do

  create_table "downvotes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "song_id"
  end

  add_index "downvotes", ["song_id"], name: "index_downvotes_on_song_id"
  add_index "downvotes", ["user_id"], name: "index_downvotes_on_user_id"

  create_table "tracks", force: :cascade do |t|
    t.string   "title"
    t.string   "artist"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "tracks", ["user_id"], name: "index_tracks_on_user_id"

  create_table "upvotes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "song_id"
  end

  add_index "upvotes", ["song_id"], name: "index_upvotes_on_song_id"
  add_index "upvotes", ["user_id"], name: "index_upvotes_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["session_token"], name: "index_users_on_session_token"

end
