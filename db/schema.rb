# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100803052447) do

  create_table "jobs", :force => true do |t|
    t.string   "company"
    t.string   "position"
    t.text     "description"
    t.string   "phone"
    t.string   "email"
    t.boolean  "fulltime"
    t.boolean  "internship"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location"
    t.string   "experience"
    t.integer  "maxpay"
    t.integer  "minpay"
  end

  create_table "posts", :force => true do |t|
    t.string   "name"
    t.string   "topic"
    t.datetime "date"
    t.text     "content"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "haslink",    :default => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
