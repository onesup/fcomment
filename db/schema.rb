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

ActiveRecord::Schema.define(version: 20140723104737) do

  create_table "comments", force: true do |t|
    t.integer  "cid"
    t.text     "message"
    t.text     "raw_data"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "pages", force: true do |t|
    t.integer  "user_id"
    t.string   "pid"
    t.string   "name"
    t.string   "username"
    t.string   "link"
    t.string   "is_published"
    t.string   "can_post"
    t.string   "location"
    t.string   "phone"
    t.string   "website"
    t.string   "about"
    t.string   "global_brand_parent_page"
    t.string   "access_token"
    t.integer  "talking_about_count"
    t.integer  "unread_message_count"
    t.integer  "unread_notif_count"
    t.integer  "unseen_message_count"
    t.integer  "were_here_count"
    t.integer  "likes"
    t.integer  "checkins"
    t.text     "cover"
    t.text     "category_list"
    t.text     "picture"
    t.text     "description"
    t.text     "description_html"
    t.text     "hours"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "raw_data"
  end

  add_index "pages", ["user_id"], name: "index_pages_on_user_id", using: :btree

  create_table "posts", force: true do |t|
    t.integer  "pid"
    t.text     "message"
    t.text     "raw_data"
    t.integer  "page_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["page_id"], name: "index_posts_on_page_id", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.string   "name"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
