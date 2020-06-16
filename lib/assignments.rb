require 'pry'
def assign_workout(user_level, user_workout)
    puts "Your level is #{user_level}"
    puts "Your are working out #{user_workout}"

    # binding.pry

    workout = Workout.all.find {|workout| workout.title == user_level}
    puts "Your workout is: #{workout.list_of_exercises}"

    

    # new_user = UserWorkout.create(level)
end