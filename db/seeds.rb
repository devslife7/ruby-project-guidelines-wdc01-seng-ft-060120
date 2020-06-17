require_relative "../app/models/exercise.rb"
require_relative "../app/models/user.rb"
require_relative "../app/models/userworkout.rb"
require_relative "../app/models/workout.rb"
require_relative "../app/models/workoutexercise.rb"
require "pry"

User.destroy_all
Workout.destroy_all
Exercise.destroy_all
Workoutexercise.destroy_all

User.create(username: "Marcos")
User.create(username: "Matine")
User.create(username: "Diego")
User.create(username: "Maddie")
User.create(username: "Paul")

arms = Workout.create(title:"Arms")
chest = Workout.create(title:"Chest")
back = Workout.create(title:"Back")
legs = Workout.create(title:"Legs")

ex1 = Exercise.create(title: "Bicep Curl")
ex2 = Exercise.create(title: "Diamond Push up")
ex3 = Exercise.create(title: "Bench Press")
ex4 = Exercise.create(title: "Pull Ups")
ex5 = Exercise.create(title: "Tricep Extension")
ex6 = Exercise.create(title: "Squats")
ex7 = Exercise.create(title: "Squats Jumps")
ex8 = Exercise.create(title: "High Knees")
ex9 = Exercise.create(title: "Side Lunges")
ex10 = Exercise.create(title: "Deadlift")
ex11 = Exercise.create(title: "800 meter run")


Workoutexercise.create(workout_id: arms.id, exercise_id: ex1.id)
Workoutexercise.create(workout_id: arms.id, exercise_id: ex2.id)
Workoutexercise.create(workout_id: arms.id, exercise_id: ex3.id)
Workoutexercise.create(workout_id: arms.id, exercise_id: ex4.id)
Workoutexercise.create(workout_id: arms.id, exercise_id: ex5.id)

Workoutexercise.create(workout_id: chest.id, exercise_id: ex2.id)
Workoutexercise.create(workout_id: chest.id, exercise_id: ex3.id)
Workoutexercise.create(workout_id: chest.id, exercise_id: ex4.id)

Workoutexercise.create(workout_id: back.id, exercise_id: ex2.id)
Workoutexercise.create(workout_id: back.id, exercise_id: ex4.id)
Workoutexercise.create(workout_id: back.id, exercise_id: ex5.id)

Workoutexercise.create(workout_id: legs.id, exercise_id: ex6.id)
Workoutexercise.create(workout_id: legs.id, exercise_id: ex7.id)
Workoutexercise.create(workout_id: legs.id, exercise_id: ex8.id)
Workoutexercise.create(workout_id: legs.id, exercise_id: ex9.id)
Workoutexercise.create(workout_id: legs.id, exercise_id: ex10.id)
Workoutexercise.create(workout_id: legs.id, exercise_id: ex11.id)

# binding.pry