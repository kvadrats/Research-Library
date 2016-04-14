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

ActiveRecord::Schema.define(version: 20160414093325) do

  create_table "bookmarks", force: :cascade do |t|
    t.string   "list"
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bookmarks", ["post_id"], name: "index_bookmarks_on_post_id"
  add_index "bookmarks", ["user_id"], name: "index_bookmarks_on_user_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "journal_articles", force: :cascade do |t|
    t.string  "title"
    t.string  "link"
    t.string  "author"
    t.date    "articledate"
    t.integer "user_id"
    t.integer "post_id"
  end

  add_index "journal_articles", ["post_id"], name: "index_journal_articles_on_post_id"
  add_index "journal_articles", ["user_id"], name: "index_journal_articles_on_user_id"

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "subcategory_id"
    t.integer  "user_id"
  end

  add_index "posts", ["subcategory_id"], name: "index_posts_on_subcategory_id"
  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "research_papers", force: :cascade do |t|
    t.string   "title"
    t.string   "link"
    t.string   "university"
    t.decimal  "price",        precision: 8, scale: 2
    t.string   "author"
    t.date     "researchdate"
    t.integer  "user_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "post_id"
  end

  add_index "research_papers", ["post_id"], name: "index_research_papers_on_post_id"
  add_index "research_papers", ["user_id"], name: "index_research_papers_on_user_id"

  create_table "subcategories", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "subcategories", ["category_id"], name: "index_subcategories_on_category_id"

  create_table "subcategories_users", id: false, force: :cascade do |t|
    t.integer "user_id",        null: false
    t.integer "subcategory_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

end
