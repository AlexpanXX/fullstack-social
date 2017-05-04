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

ActiveRecord::Schema.define(version: 20170501021937) do

  create_table "evaluations", force: :cascade do |t|
    t.integer  "valuer_id"
    t.integer  "receiver_id"
    t.text     "message"
    t.integer  "type_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["receiver_id"], name: "index_evaluations_on_receiver_id"
    t.index ["valuer_id"], name: "index_evaluations_on_valuer_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.integer  "inviter_id"
    t.integer  "invited_id"
    t.text     "message"
    t.integer  "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invited_id"], name: "index_invitations_on_invited_id"
    t.index ["inviter_id"], name: "index_invitations_on_inviter_id"
  end

  create_table "replies", force: :cascade do |t|
    t.integer  "invitation_id"
    t.text     "content"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["invitation_id"], name: "index_replies_on_invitation_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "avatar"
    t.string   "nickname"
    t.string   "gender"
    t.string   "wechat"
    t.string   "github"
    t.string   "logdown"
    t.string   "role"
    t.boolean  "is_admin",               default: false
    t.integer  "invitations_count",      default: 0
    t.integer  "evaluations_count",      default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
