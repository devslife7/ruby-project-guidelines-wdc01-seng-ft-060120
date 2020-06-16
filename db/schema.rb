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

ActiveRecord::Schema.define(version: 2020_06_16_185127) do

  create_table "exercises", force: :cascade do |t|
    t.string "title"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
  end

  create_table "userworkouts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "workout_id"
  end

  create_table "workoutexercises", force: :cascade do |t|
    t.integer "workout_id"
    t.integer "exercise_id"
    t.integer "sets"
    t.integer "reps"
  end

  create_table "workouts", force: :cascade do |t|
    t.string "title"
    t.string "list_of_exercises"
    t.string "workout_area"
  end

end
