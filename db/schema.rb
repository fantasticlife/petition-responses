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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "petitions", force: :cascade do |t|
    t.integer  "parliament",                                  null: false
    t.integer  "petition_id",                                 null: false
    t.string   "url",                             limit: 300, null: false
    t.text     "action",                                      null: false
    t.integer  "signature_count",                             null: false
    t.datetime "created_at",                                  null: false
    t.datetime "opened_at",                                   null: false
    t.datetime "closed_at"
    t.datetime "moderation_threshold_reached_at"
    t.datetime "response_threshold_reached_at",               null: false
    t.datetime "government_response_at",                      null: false
    t.date     "government_response_on",                      null: false
    t.text     "government_response_summary",                 null: false
  end

end
