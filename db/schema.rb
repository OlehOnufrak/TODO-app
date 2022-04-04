# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_04_04_065329) do

  create_table "invites", force: :cascade do |t|
    t.string "token"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "my_audience_id", null: false
    t.index ["my_audience_id"], name: "index_invites_on_my_audience_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "my_audience_id", null: false
    t.integer "user_id", null: false
    t.index ["my_audience_id"], name: "index_memberships_on_my_audience_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "my_audiences", force: :cascade do |t|
    t.string "user_email"
    t.string "todo_list"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "todo_items", force: :cascade do |t|
    t.string "title"
    t.integer "todo_list_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "done_at"
    t.index ["todo_list_id"], name: "index_todo_items_on_todo_list_id"
  end

  create_table "todo_lists", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_todo_lists_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sign_in_count"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "invites", "my_audiences"
  add_foreign_key "memberships", "my_audiences"
  add_foreign_key "memberships", "users"
  add_foreign_key "todo_items", "todo_lists"
  add_foreign_key "todo_lists", "users"
end
