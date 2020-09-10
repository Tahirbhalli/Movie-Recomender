# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_10_145511) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "directors", force: :cascade do |t|
    t.string "name", null: false
    t.string "image"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "genersandmovies", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "genersofmovie_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["genersofmovie_id"], name: "index_genersandmovies_on_genersofmovie_id"
    t.index ["movie_id"], name: "index_genersandmovies_on_movie_id"
  end

  create_table "genersandusers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "genersofmovie_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["genersofmovie_id"], name: "index_genersandusers_on_genersofmovie_id"
    t.index ["user_id"], name: "index_genersandusers_on_user_id"
  end

  create_table "genersofmovies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "liked_movies", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "movie_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_liked_movies_on_movie_id"
    t.index ["user_id"], name: "index_liked_movies_on_user_id"
  end

  create_table "movie_images", force: :cascade do |t|
    t.string "image_url"
    t.bigint "movie_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_movie_images_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.string "poster_url"
    t.text "description", default: "N/A"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "director_id"
    t.index ["director_id"], name: "index_movies_on_director_id"
  end

  create_table "starandmovies", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "star_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_starandmovies_on_movie_id"
    t.index ["star_id"], name: "index_starandmovies_on_star_id"
  end

  create_table "starandusers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "star_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["star_id"], name: "index_starandusers_on_star_id"
    t.index ["user_id"], name: "index_starandusers_on_user_id"
  end

  create_table "stars", force: :cascade do |t|
    t.string "name"
    t.string "pic_url"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "genersandmovies", "genersofmovies"
  add_foreign_key "genersandmovies", "movies"
  add_foreign_key "genersandusers", "genersofmovies"
  add_foreign_key "genersandusers", "users"
  add_foreign_key "liked_movies", "movies"
  add_foreign_key "liked_movies", "users"
  add_foreign_key "movie_images", "movies"
  add_foreign_key "movies", "directors"
  add_foreign_key "starandmovies", "movies"
  add_foreign_key "starandmovies", "stars"
  add_foreign_key "starandusers", "stars"
  add_foreign_key "starandusers", "users"
end
