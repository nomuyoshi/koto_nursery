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

ActiveRecord::Schema.define(version: 2021_08_14_073454) do

  create_table "borderlines", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "nursery_school_id", null: false
    t.integer "zero"
    t.boolean "zero_priority_order"
    t.integer "one"
    t.boolean "one_priority_order"
    t.integer "two"
    t.boolean "two_priority_order"
    t.integer "three"
    t.boolean "three_priority_order"
    t.integer "four"
    t.boolean "four_priority_order"
    t.integer "five"
    t.boolean "five_priority_order"
    t.integer "year", null: false
    t.boolean "latest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["nursery_school_id"], name: "index_borderlines_on_nursery_school_id"
  end

  create_table "capacities", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "nursery_school_id", null: false
    t.integer "zero"
    t.integer "one"
    t.integer "two"
    t.integer "three"
    t.integer "four"
    t.integer "five"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["nursery_school_id"], name: "index_capacities_on_nursery_school_id", unique: true
  end

  create_table "nursery_schools", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "code", null: false
    t.string "name", null: false
    t.string "address", null: false
    t.string "phone_number", null: false
    t.integer "kind", default: 0, null: false
    t.integer "min_acceptable_age_type", null: false
    t.integer "opening_type", null: false
    t.string "access"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "borderlines", "nursery_schools"
  add_foreign_key "capacities", "nursery_schools"
end
