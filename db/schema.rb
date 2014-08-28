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

ActiveRecord::Schema.define(version: 20140828031800) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adventures", force: true do |t|
    t.integer "user_id"
  end

  create_table "adventures_chapters", force: true do |t|
    t.integer "adventure_id"
    t.integer "chapter_id"
  end

  create_table "avatars", force: true do |t|
    t.text    "avatar"
    t.integer "user_id"
  end

  create_table "chapters", force: true do |t|
    t.string  "prompt"
    t.text    "episode"
    t.integer "parent_chapter_id"
  end

  create_table "users", force: true do |t|
    t.string  "name"
    t.string  "hashed_password"
    t.integer "avatar_id"
    t.text    "bio"
    t.string  "fave"
  end

end
