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

ActiveRecord::Schema.define(version: 20171125092239) do

  create_table "abouts", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "abouts", ["user_id"], name: "index_abouts_on_user_id"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

# Could not dump table "design_documents" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "doc_comments", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "design_document_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "doc_comments", ["design_document_id"], name: "index_doc_comments_on_design_document_id"
  add_index "doc_comments", ["user_id"], name: "index_doc_comments_on_user_id"

  create_table "forum_boards", force: :cascade do |t|
    t.string   "subject"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "forum_boards", ["user_id"], name: "index_forum_boards_on_user_id"

  create_table "forum_comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "forum_post_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "forum_comments", ["forum_post_id"], name: "index_forum_comments_on_forum_post_id"
  add_index "forum_comments", ["user_id"], name: "index_forum_comments_on_user_id"

# Could not dump table "forum_posts" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "images", force: :cascade do |t|
    t.string   "alt"
    t.string   "hint"
    t.string   "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notices", force: :cascade do |t|
    t.string   "title"
    t.string   "startDate"
    t.string   "endDate"
    t.string   "address"
    t.float    "y_location"
    t.float    "x_location"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "notices", ["user_id"], name: "index_notices_on_user_id"

  create_table "open_comments", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "opensrc_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "open_comments", ["opensrc_id"], name: "index_open_comments_on_opensrc_id"
  add_index "open_comments", ["user_id"], name: "index_open_comments_on_user_id"

  create_table "opensrcs", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "github"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "opensrcs", ["user_id"], name: "index_opensrcs_on_user_id"

  create_table "qnas", force: :cascade do |t|
    t.string   "title"
    t.string   "category"
    t.text     "content"
    t.string   "image"
    t.integer  "reply_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "answer"
  end

  add_index "qnas", ["reply_id"], name: "index_qnas_on_reply_id"
  add_index "qnas", ["user_id"], name: "index_qnas_on_user_id"

  create_table "replies", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "image"
    t.integer  "user_id"
    t.integer  "qna_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "replies", ["qna_id"], name: "index_replies_on_qna_id"
  add_index "replies", ["user_id"], name: "index_replies_on_user_id"

# Could not dump table "trends" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "users", force: :cascade do |t|
    t.string   "email",                      default: "", null: false
    t.string   "name",                       default: "", null: false
    t.string   "nickname",                   default: "", null: false
    t.boolean  "admin"
    t.string   "company_name"
    t.boolean  "company_private"
    t.string   "company_address"
    t.string   "company_address_details"
    t.string   "company_address_extra_info"
    t.string   "company_address_post_num"
    t.string   "company_tel_num_1"
    t.string   "company_tel_num_2"
    t.string   "company_tel_num_3"
    t.string   "encrypted_password",         default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",              default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["nickname"], name: "index_users_on_nickname", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
