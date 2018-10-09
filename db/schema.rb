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

ActiveRecord::Schema.define(version: 2018_10_08_115720) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "doses", force: :cascade do |t|
    t.string "ingredient"
    t.float "quantite"
    t.string "unite"
    t.bigint "recette_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "listecourse_id"
    t.index ["listecourse_id"], name: "index_doses_on_listecourse_id"
    t.index ["recette_id"], name: "index_doses_on_recette_id"
  end

  create_table "jours", force: :cascade do |t|
    t.bigint "semaine_id"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["semaine_id"], name: "index_jours_on_semaine_id"
  end

  create_table "listecourses", force: :cascade do |t|
    t.bigint "semaine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["semaine_id"], name: "index_listecourses_on_semaine_id"
  end

  create_table "recettes", force: :cascade do |t|
    t.string "nom"
    t.text "instruction"
    t.integer "nb_personne"
    t.boolean "deja_choisie", default: false
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.integer "cuisson"
    t.integer "preparation"
    t.string "difficulté"
    t.bigint "jour_id"
    t.index ["jour_id"], name: "index_recettes_on_jour_id"
  end

  create_table "semaines", force: :cascade do |t|
    t.boolean "active", default: true
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "numero"
    t.boolean "set", default: false
    t.index ["user_id"], name: "index_semaines_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "doses", "listecourses"
  add_foreign_key "doses", "recettes"
  add_foreign_key "jours", "semaines"
  add_foreign_key "listecourses", "semaines"
  add_foreign_key "recettes", "jours"
  add_foreign_key "semaines", "users"
end
