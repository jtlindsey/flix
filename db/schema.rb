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

ActiveRecord::Schema.define(version: 20140524162550) do

  create_table "characterizations", force: true do |t|
    t.integer  "movie_id"
    t.integer  "genre_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "characterizations", ["genre_id"], name: "index_characterizations_on_genre_id"
  add_index "characterizations", ["movie_id"], name: "index_characterizations_on_movie_id"

  create_table "favorites", force: true do |t|
    t.integer  "movie_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorites", ["movie_id"], name: "index_favorites_on_movie_id"
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id"

  create_table "genres", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movies", force: true do |t|
    t.string   "title"
    t.string   "rating"
    t.decimal  "total_gross"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.date     "released_on"
    t.string   "cast"
    t.string   "director"
    t.string   "duration"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "slug"
  end

  create_table "reviews", force: true do |t|
    t.integer  "stars"
    t.text     "comment"
    t.integer  "movie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "reviews", ["movie_id"], name: "index_reviews_on_movie_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.boolean  "admin",           default: false
  end

end
