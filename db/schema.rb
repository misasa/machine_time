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

ActiveRecord::Schema.define(version: 20181113052133) do

  create_table "machines", force: true do |t|
    t.string   "global_id"
    t.string   "name"
    t.text     "description"
    t.string   "state"
    t.string   "session_prefix"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "archiver_url"
  end

  create_table "session_targets", force: true do |t|
    t.integer  "session_id"
    t.integer  "target_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "session_targets", ["session_id"], name: "index_session_targets_on_session_id"
  add_index "session_targets", ["target_id"], name: "index_session_targets_on_target_id"

  create_table "sessions", force: true do |t|
    t.string   "global_id"
    t.integer  "number"
    t.string   "name"
    t.text     "description"
    t.datetime "started_at"
    t.datetime "stopped_at"
    t.integer  "machine_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "targets", force: true do |t|
    t.string   "global_id",   null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
