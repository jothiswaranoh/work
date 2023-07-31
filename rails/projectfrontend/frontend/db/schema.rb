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

ActiveRecord::Schema[7.0].define(version: 2023_07_31_055637) do
  create_table "address_data", force: :cascade do |t|
    t.string "door_number"
    t.string "floor_number"
    t.string "building_name"
    t.string "street_name"
    t.string "area"
    t.string "post"
    t.string "village_town"
    t.string "pincode"
    t.string "landmark"
    t.string "city"
    t.string "district"
    t.string "state"
    t.string "country"
    t.string "continent"
    t.string "current_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "form_data", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "username"
    t.string "password"
    t.string "confirm_password"
    t.string "school"
    t.float "tenth_percentage"
    t.float "twelfth_percentage"
    t.string "college"
    t.float "cgpa"
    t.string "adhar_card_number"
    t.string "pan_card_number"
    t.string "profession"
    t.string "instagram_id"
    t.string "facebook_id"
    t.string "twitter_id"
    t.string "thread_id"
    t.string "whatsapp_number"
    t.string "father_number"
    t.string "mother_number"
    t.string "father_contact"
    t.string "mother_contact"
    t.string "marital_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "official_data", force: :cascade do |t|
    t.string "company"
    t.string "role"
    t.string "employee_id"
    t.string "employee_mail_id"
    t.string "laptop_serial"
    t.string "laptop_model"
    t.string "laptop_brand"
    t.string "laptop_mac"
    t.string "hoodies"
    t.string "experience"
    t.string "account_number"
    t.string "bank_name"
    t.string "branch"
    t.string "ifsc_code"
    t.string "account_holder_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
