require_relative "../app/models/exercise.rb"
require_relative "../app/models/user.rb"
require_relative "../app/models/userworkout.rb"
require_relative "../app/models/workout.rb"
require_relative "../app/models/workoutexercise.rb"
User.destroy_all
Workout.destroy_all
Exercise.destroy_all

User.create(name: "Marcos")
User.create(name: "Matine")
User.create(name: "Diego")
User.create(name: "Maddie")
User.create(name: "Paul")

Workout.create(title:"Beginner", list_of_exercises: "Bicep Curl, Tricep Extension, Squat, Deadlift")
Workout.create(title:"Intermediate", list_of_exercises: "Bicep Curl, Tricep Extension, Squat, Deadlift,Bench Press")
Workout.create(title:"Advanced", list_of_exercises: "Bicep Curl, Squat, Deadlift, Running 500 meters")
Workout.create(title:"Advanced Bocce", list_of_exercises: "Bicep Curl, Squat, Deadlift, Running 500 meters, Bench Press")

Exercise.create(title: "Bicep Curl")
Exercise.create(title: "Tricep Extension")
Exercise.create(title: "Squats")
Exercise.create(title: "Deadlift")
Exercise.create(title: "Bench Press")
Exercise.create(title: "Running 500 meters")

##WorkoutExercise.create(workout_id: "1")












# Student.create(name: "April", grade: "10th")
# Student.create(name: "Luke", grade: "9th")
# Student.create(name: "Devon", grade: "11th")
# Student.create(name: "Sarah", grade: "10th")