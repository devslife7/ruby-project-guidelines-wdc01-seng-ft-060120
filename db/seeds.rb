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

Workout.create(title:"Beginner", list_of_exercises: "Bicep Curl, Tricep Extension, Squat, Deadlift", workout_area: "Arms")
Workout.create(title:"Beginner", list_of_exercises: "Bicep Curl, Tricep Extension, Squat, Deadlift", workout_area: "Legs")
Workout.create(title:"Beginner", list_of_exercises: "Bicep Curl, Tricep Extension, Squat, Deadlift", workout_area: "Chest")
Workout.create(title:"Beginner", list_of_exercises: "Bicep Curl, Tricep Extension, Squat, Deadlift", workout_area: "Back")
Workout.create(title:"Intermediate", list_of_exercises: "Bicep Curl, Tricep Extension, Squat, Deadlift,Bench Press", workout_area: "Arms")
Workout.create(title:"Intermediate", list_of_exercises: "Bicep Curl, Tricep Extension, Squat, Deadlift,Bench Press", workout_area: "Legs")
Workout.create(title:"Intermediate", list_of_exercises: "Bicep Curl, Tricep Extension, Squat, Deadlift,Bench Press", workout_area: "Chest")
Workout.create(title:"Intermediate", list_of_exercises: "Bicep Curl, Tricep Extension, Squat, Deadlift,Bench Press", workout_area: "Back")
Workout.create(title:"Advanced", list_of_exercises: "Bicep Curl, Squat, Deadlift, Running 500 meters", workout_area: "Arms")
Workout.create(title:"Advanced", list_of_exercises: "Bicep Curl, Squat, Deadlift, Running 500 meters", workout_area: "Leg")
Workout.create(title:"Advanced", list_of_exercises: "Bicep Curl, Squat, Deadlift, Running 500 meters", workout_area: "Chest")
Workout.create(title:"Advanced", list_of_exercises: "Bicep Curl, Squat, Deadlift, Running 500 meters", workout_area: "Back")
Workout.create(title:"Pro", list_of_exercises: "Bicep Curl, Squat, Deadlift, Running 500 meters, Bench Press", workout_area: "Arms")
Workout.create(title:"Pro", list_of_exercises: "Bicep Curl, Squat, Deadlift, Running 500 meters, Bench Press", workout_area: "Legs")
Workout.create(title:"Pro", list_of_exercises: "Bicep Curl, Squat, Deadlift, Running 500 meters, Bench Press", workout_area: "Chest")
Workout.create(title:"Pro", list_of_exercises: "Bicep Curl, Squat, Deadlift, Running 500 meters, Bench Press", workout_area: "Back")

Exercise.create(title: "Bicep Curl")
Exercise.create(title: "Tricep Extension")
Exercise.create(title: "Squats")
Exercise.create(title: "Deadlift")
Exercise.create(title: "Bench Press")
Exercise.create(title: "Running 500 meters")