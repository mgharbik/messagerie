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

ActiveRecord::Schema.define(version: 20151030092256) do

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "conversations", ["receiver_type", "receiver_id"], name: "index_conversations_on_receiver_type_and_receiver_id"
  add_index "conversations", ["sender_type", "sender_id"], name: "index_conversations_on_sender_type_and_sender_id"

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "conversation_id"
    t.boolean  "is_read"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id"
  add_index "messages", ["owner_type", "owner_id"], name: "index_messages_on_owner_type_and_owner_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
