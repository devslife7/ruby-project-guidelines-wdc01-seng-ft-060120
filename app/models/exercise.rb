class Exercise < ActiveRecord::Base
    has_many :workoutexercises
    has_many :workouts, through: :workoutexercises
end