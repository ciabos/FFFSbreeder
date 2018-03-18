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

ActiveRecord::Schema.define(version: 20180318083900) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animals", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sex"
    t.string "name"
    t.string "home_name"
    t.string "phenotype"
    t.string "genotype"
    t.text "additional_info"
    t.bigint "litter_id"
    t.index ["litter_id"], name: "index_animals_on_litter_id"
  end

  create_table "breeders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rattery_name"
    t.string "email"
    t.string "full_name"
  end

  create_table "litters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.datetime "birth_date"
    t.text "expected_traits", default: [], array: true
    t.bigint "breeder_id", null: false
    t.bigint "father_id"
    t.bigint "mother_id"
    t.index ["breeder_id"], name: "index_litters_on_breeder_id"
    t.index ["father_id"], name: "index_litters_on_father_id"
    t.index ["mother_id"], name: "index_litters_on_mother_id"
  end

  add_foreign_key "litters", "animals", column: "father_id"
  add_foreign_key "litters", "animals", column: "mother_id"
  add_foreign_key "litters", "breeders"
end
