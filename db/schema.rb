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

ActiveRecord::Schema.define(version: 2021_07_31_111030) do

  create_table "authors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "authorships", force: :cascade do |t|
    t.integer "author_id", null: false
    t.integer "book_id", null: false
    t.index %w[author_id book_id], name: "index_authorships_on_author_id_and_book_id"
    t.index ["author_id"], name: "index_authorships_on_author_id"
    t.index ["book_id"], name: "index_authorships_on_book_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.decimal "price", precision: 5, scale: 2
    t.text "description"
    t.decimal "height", precision: 4, scale: 2
    t.decimal "width", precision: 4, scale: 2
    t.decimal "depth", precision: 4, scale: 2
    t.integer "year_of_publication"
    t.string "materials"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "category_id", null: false
    t.index ["category_id"], name: "index_books_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "book_id", null: false
    t.integer "user_id", null: false
    t.string "status", default: "unprocessed"
    t.index ["book_id"], name: "index_reviews_on_book_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "provider", default: "email"
    t.string "uid"
    t.string "name"
    t.string "avatar"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "authorships", "authors"
  add_foreign_key "authorships", "books"
  add_foreign_key "books", "categories"
  add_foreign_key "reviews", "books"
  add_foreign_key "reviews", "users"
end
