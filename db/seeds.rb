require_relative "../app/models/exercise.rb"
require_relative "../app/models/user.rb"
require_relative "../app/models/userworkout.rb"
require_relative "../app/models/workout.rb"
require_relative "../app/models/workoutexercise.rb"
User.destroy_all

User.create(name: "Michel")
User.create(name: "Daniel")
User.create(name: "Steve")
User.create(name: "Logan")

# Student.create(name: "April", grade: "10th")
# Student.create(name: "Luke", grade: "9th")
# Student.create(name: "Devon", grade: "11th")
# Student.create(name: "Sarah", grade: "10th")