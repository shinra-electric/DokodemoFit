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

ActiveRecord::Schema[7.1].define(version: 2025_08_21_071002) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "muscle_group"
    t.string "img_url"
    t.string "equipment"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "routine_id", null: false
    t.string "content"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "model_id"
    t.integer "input_tokens"
    t.integer "output_tokens"
    t.bigint "tool_call_id"
    t.index ["routine_id"], name: "index_messages_on_routine_id"
    t.index ["tool_call_id"], name: "index_messages_on_tool_call_id"
  end

  create_table "routine_exercises", force: :cascade do |t|
    t.bigint "exercises_id", null: false
    t.bigint "routines_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercises_id"], name: "index_routine_exercises_on_exercises_id"
    t.index ["routines_id"], name: "index_routine_exercises_on_routines_id"
  end

  create_table "routines", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.string "goal"
    t.string "equipment"
    t.string "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "model_id"
    t.index ["user_id"], name: "index_routines_on_user_id"
  end

  create_table "tool_calls", force: :cascade do |t|
    t.bigint "message_id", null: false
    t.string "tool_call_id"
    t.string "name"
    t.jsonb "arguments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_tool_calls_on_message_id"
    t.index ["tool_call_id"], name: "index_tool_calls_on_tool_call_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "body_type"
    t.float "weight"
    t.integer "year_of_birth"
    t.string "profile_pic_url"
    t.string "gender"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "messages", "routines"
  add_foreign_key "messages", "tool_calls"
  add_foreign_key "routine_exercises", "exercises", column: "exercises_id"
  add_foreign_key "routine_exercises", "routines", column: "routines_id"
  add_foreign_key "routines", "users"
  add_foreign_key "tool_calls", "messages"
end
