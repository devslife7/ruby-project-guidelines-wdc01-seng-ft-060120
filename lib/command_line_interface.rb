require 'tty-prompt'

def welcome
    puts "\n\n\n\n\n\n"
    puts ",--.   ,--.       ,--.                                    ,--.             ,------.,--.,--------.,--.,------.  ,-----. ,--.  ,--.   "
    puts "|  |   |  | ,---. |  | ,---. ,---. ,--,--,--. ,---.     ,-'  '-. ,---.     |  .---'|  |'--.  .--'|  ||  .--. ''  .-.  '|  ,'.|  |   "
    puts "|  |.'.|  || .-. :|  || .--'| .-. ||        || .-. :    '-.  .-'| .-. |    |  `--, |  |   |  |   |  ||  '--'.'|  | |  ||  |' '  |   "
    puts "|   ,'.   |\   --.|  |\ `--.' '-' '|  |  |  |\   --.      |  |  ' '-' '    |  |`   |  |   |  |   |  ||  |\  \ '  '-'  '|  | `   |   "
    puts "'--'   '--' `----'`--' `---' `---' `--`--`--' `----'      `--'   `---'     `--'    `--'   `--'   `--'`--' '--' `-----' `--'  `--'   "
    puts "\n\n\n"
end
    
def greet_user
        puts "Hello! Whats Your Name?"
        name = gets.chomp()
        puts "Welcome, #{name.capitalize}!"
end 

def login_or_setup
    puts "What's you name to sign up or login?"
    answer = gets.chomp.capitalize

    user = User.find_or_create_by(username: answer)
    sleep(1)
    puts "Hello, #{user.username.capitalize}!"
end

# def user_log_in
#     puts "1.Log in"
#     puts "2.Register"
#     input = gets.chomp()
# end

# def log_in
#     puts "Enter username"
#     username = gets.chomp()
#     puts "Enter password"
#     password = gets.chomp()
#     log_in_validation(username, password)
# end


# def log_in_validation(username, password)
#     # validates user return true/false
# end

# def register
#     puts "What would be your user name"
#     username = gets.chomp()
#     puts "Create Password"
#     password = gets.chomp()
# end

# prompts and returns the users level of fitness
def user_level
    prompt = TTY::Prompt.new
    input = prompt.select("Choose Your Level:", %w(Beginner Intermediate Advanced Pro))
end

# prompts and returns the users selected workout
def user_workout
    prompt = TTY::Prompt.new
    input = prompt.select("What would you like to work on today:", %w(Arms Legs Chest Back))

    # gets workout for that user
    # if Level == beginner return beginner workout
end

def recommend_exercises(user_workout)
    workout = Workout.find_by(title: user_workout)
    
    list = workout.exercises.collect do |exercise|
        exercise.title
    end

    puts "Your recommended workouts are: #{list.join(', ')}"
end

def add_exercise
    prompt = TTY::Prompt.new

    choices = %w(Arms Chest Back Legs)
    workouts_to_edit = prompt.multi_select("Select workouts to add exercise", choices)
    
    puts "Add exercises separated by commas: (exercise1, exercise2, exercise3)"
    new_exercises = gets.chomp()
    new_exercises = new_exercises.split(", ")
    add_user_exercise(workouts_to_edit, new_exercises)
end

def add_user_exercise(workouts_to_edit, new_exercises)
    workouts_to_edit.each do |workout|
        new_exercises.each do |exercise|
            workout_instance = Workout.find_by(title: workout)
            exercise_instance = Exercise.create(title: exercise)
            Workoutexercise.create(workout_id: workout_instance.id, exercise_id: exercise_instance.id)
        end
    end

    puts "Success!"
    puts "We have succesfully added #{new_exercises.join(", ")}."
    puts "to the following workout(s): #{workouts_to_edit.join(", ")}"
end

def create_workout
    puts "Name the workout you would like to create:"
    user_workout = gets.chomp.capitalize
    puts "What exercises would #{user_workout} workout have: (exercise1, exercise2, exercise3, exercise4)"
    user_exercises = gets.chomp
    user_exercises = user_exercises.split(", ")

    created_workout = Workout.create(title: user_workout)

    user_exercises.each do |exercise|
        created_exercise = Exercise.create(title: exercise)
        Workoutexercise.create(workout_id: created_workout.id, exercise_id: created_exercise.id)
    end

    puts "Success!"
    puts "We have succesfully added #{user_exercises.length} new exercise(s) to #{user_workout} << #{user_exercises.join(", ")}"
end