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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120206142524) do

  create_table "book_readings", :force => true do |t|
    t.integer  "report_id"
    t.integer  "book_id"
    t.integer  "starting_pp"
    t.integer  "ending_pp"
    t.string   "sections"
    t.float    "duration_hr"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "books", :force => true do |t|
    t.string   "name"
    t.string   "author"
    t.integer  "edition"
    t.integer  "pub_year"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "codings", :force => true do |t|
    t.integer  "report_id"
    t.string   "description"
    t.string   "language"
    t.float    "duration_hr"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "en_words", :force => true do |t|
    t.integer  "report_id"
    t.string   "word"
    t.string   "meaning"
    t.string   "synonyms"
    t.string   "sentence"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "misc_things", :force => true do |t|
    t.integer  "report_id"
    t.string   "description"
    t.float    "duration_hr"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "reports", :force => true do |t|
    t.date     "date_for"
    t.date     "date_created"
    t.integer  "author_id"
    t.integer  "reviewer_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "admin"
    t.string   "encrypted_password"
    t.string   "salt"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

end
