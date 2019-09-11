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

ActiveRecord::Schema.define(version: 2019_09_11_072705) do

  create_table "addresses", force: :cascade do |t|
    t.string "sub_family_name", null: false
    t.string "sub_first_name", null: false
    t.string "sub_family_kana", null: false
    t.string "sub_first_kana", null: false
    t.string "sub_post_code", null: false
    t.string "sub_address", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admins", force: :cascade do |t|
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "artists", force: :cascade do |t|
    t.string "artist_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.string "quantity", null: false
    t.integer "user_id", null: false
    t.integer "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "item_name", null: false
    t.integer "artist_id", null: false
    t.integer "price", null: false
    t.integer "genre_id", null: false
    t.integer "label_id", null: false
    t.integer "items_status", null: false
    t.boolean "is_deleted", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_items_on_artist_id"
    t.index ["item_name"], name: "index_items_on_item_name"
  end

  create_table "labels", force: :cascade do |t|
    t.string "label_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_options", force: :cascade do |t|
    t.integer "payment", null: false
    t.integer "delivery_status", null: false
    t.integer "postage", null: false
    t.integer "total_price", null: false
    t.string "to_post_code", null: false
    t.string "to_address", null: false
    t.string "to_name", null: false
    t.string "to_kana", null: false
    t.integer "item_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "past_price", null: false
    t.datetime "purchase_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text "review_text", null: false
    t.integer "user_id", null: false
    t.integer "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string "song_name", null: false
    t.integer "disc_number", null: false
    t.integer "track_number", null: false
    t.integer "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_name"], name: "index_songs_on_song_name"
  end

  create_table "stocks", force: :cascade do |t|
    t.date "stock_date", null: false
    t.integer "stock_count", null: false
    t.string "trader", null: false
    t.integer "trade_price", null: false
    t.integer "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "family_name", null: false
    t.string "first_name", null: false
    t.string "family_kana", null: false
    t.string "first_kana", null: false
    t.string "post_code", null: false
    t.string "address", null: false
    t.string "phone", null: false
    t.boolean "is_quit", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["family_kana"], name: "index_users_on_family_kana"
    t.index ["family_name"], name: "index_users_on_family_name"
    t.index ["first_kana"], name: "index_users_on_first_kana"
    t.index ["first_name"], name: "index_users_on_first_name"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
