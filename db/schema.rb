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

ActiveRecord::Schema.define(version: 2018_10_29_193231) do

  create_table "challenges", force: :cascade do |t|
    t.string "category"
    t.integer "length"
    t.integer "issuer_id"
    t.integer "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "problem_array"
    t.integer "issuer_score"
    t.integer "receiver_score"
    t.boolean "accepted"
  end

  create_table "posts", force: :cascade do |t|
    t.string "author"
    t.text "post_entry"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "problems", force: :cascade do |t|
    t.string "problem_type"
    t.string "question"
    t.string "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "username"
    t.string "location"
    t.text "bio"
    t.text "friends"
    t.string "avatar"
    t.text "pending_friend_invitations"
    t.text "pending_friend_requests"
    t.text "pending_challenge_requests"
    t.text "pending_challenge_invitations"
    t.text "challenges"
    t.integer "challenge_wins", default: 0
    t.integer "challenge_losses", default: 0
    t.integer "challenge_ties", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
