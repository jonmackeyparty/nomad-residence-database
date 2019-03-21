# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20190320155659) do

  create_table "landlords", force: :cascade do |t|
    t.string "name"
  end

  create_table "nomad_to_roommate_loans", force: :cascade do |t|
    t.integer "amount"
    t.date    "date"
    t.integer "nomad_id"
    t.integer "roommate_id"
    t.string  "line_item"
  end

  create_table "nomads", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "username"
  end

  create_table "residences", force: :cascade do |t|
    t.string  "address"
    t.integer "deposit"
    t.integer "landlord_id"
    t.integer "nomad_id"
    t.boolean "primary_residence", default: false, null: false
    t.boolean "deposit_refunded",  default: false, null: false
  end

  create_table "roommate_to_nomad_loans", force: :cascade do |t|
    t.integer "amount"
    t.date    "date"
    t.integer "nomad_id"
    t.integer "roommate_id"
    t.string  "line_item"
  end

  create_table "roommates", force: :cascade do |t|
    t.string  "name"
    t.integer "residence_id"
  end

end
