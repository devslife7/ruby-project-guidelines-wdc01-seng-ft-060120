class Exercise < ActiveRecord::Base
    has_many :workout_exercises
    has_many :workouts, through: :workout_exercises
    
    # def exercise
    #     #will obtain the file with all the types of exercises
    # end
end