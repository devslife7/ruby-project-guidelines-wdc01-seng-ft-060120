class Workout < ActiveRecord::Base
    has_many :userworkouts
    has_many :users, through: :userworkouts
    has_many :workoutexercises
    has_many :exercises, through: :workoutexercises
end