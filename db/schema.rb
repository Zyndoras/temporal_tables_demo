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

ActiveRecord::Schema[7.0].define(version: 2023_02_03_145909) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "post_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "comments_h", id: false, force: :cascade do |t|
    t.datetime "eff_from", null: false
    t.datetime "eff_to", default: "9999-12-31 00:00:00", null: false
    t.uuid "id"
    t.uuid "post_id"
    t.string "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["id", "eff_to"], name: "index_comments_h_on_id_and_eff_to"
    t.index ["post_id"], name: "index_comments_on_post_id_h"
  end

  create_table "posts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts_h", id: false, force: :cascade do |t|
    t.datetime "eff_from", null: false
    t.datetime "eff_to", default: "9999-12-31 00:00:00", null: false
    t.uuid "id"
    t.string "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["id", "eff_to"], name: "index_posts_h_on_id_and_eff_to"
  end

  add_foreign_key "comments", "posts"
end
