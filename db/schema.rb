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

ActiveRecord::Schema.define(version: 2022_02_01_085254) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "completed_flashcards", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "flashcard_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["flashcard_id"], name: "index_completed_flashcards_on_flashcard_id"
    t.index ["user_id"], name: "index_completed_flashcards_on_user_id"
  end

  create_table "flashcards", force: :cascade do |t|
    t.string "question"
    t.string "notes"
    t.string "type"
    t.string "answer"
    t.string "option1"
    t.string "option2"
    t.string "option3"
    t.string "option4"
    t.boolean "option1_correct"
    t.boolean "option2_correct"
    t.boolean "option3_correct"
    t.boolean "option4_correct"
    t.integer "correct_option"
    t.boolean "correct"
    t.bigint "stack_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stack_id"], name: "index_flashcards_on_stack_id"
  end

  create_table "stacks", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_stacks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "completed_flashcards", "flashcards"
  add_foreign_key "completed_flashcards", "users"
  add_foreign_key "flashcards", "stacks"
  add_foreign_key "stacks", "users"
end
