require 'tty-prompt'
require 'open-uri'
require 'net/http'
require 'json'


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
    puts "What's you name?"
    input = gets.chomp.capitalize

    if User.find_by(username: input) != nil
        puts "Welcome back #{input}"
    else
        puts "Welcome new user"
        puts "Lets add you to our database"
        sleep(3)
        user = User.create(username: input)
        puts "Successfully added #{user.username} to User table"
    end
    # user = User.find_or_create_by(username: answer)
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

    prompt_array = ["Arms\n", "Legs\n", "Chest\n", "Back\n"]
    prompt = TTY::Prompt.new
    input = prompt.select(" What would you like to work on today:\n", prompt_array)

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

def random_quote
    url = "https://type.fit/api/quotes"
    # url = "https://www.bulkhackers.com/wp-json/bulk-hackers/get-quotes"
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    response.body
    json = JSON.parse(response.body)

    random_number = rand(1600)

    puts "\n\n\n\t\t\t\"#{json[random_number]["text"]}\"\n\n"
    puts "\t\t\t\t- #{json[random_number]["author"]}\n\n\n\n\n\n"
end

def menu
    # pastel = Pastel.new
    # puts pastel.cyan("Hello World")
    # font = TTY::Font.new(:starwars)
    # puts pastel.cyan(font.write("Welcome to Fitiron"))
    # spinner = TTY::Spinner.new("[:spinner] Scribbling...", format: :pulse_2)
    # spinner.auto_spin
    # sleep(2)
    # spinner.stop('Thanks for your using Fitiron!')
    # bar = TTY::ProgressBar.new("Saving changes... [:bar]", total: 30)
    # 30.times do 
    #     sleep(0.1)
    #     bar.advance(1)
    # end



    prompt_array = ["Get Workout\n", "Add Workout\n", "Add Exercise\n", "Week Schedule\n", "Motivational Quote\n", "Exit\n"]
    prompt = TTY::Prompt.new
    input = prompt.select("\n\n Main menu:\n", prompt_array) # %w(Get_Workout add_exercise create_workout look_week_schedule motivational_quote exit))

    case input
    when "Get Workout\n"
        workout = user_workout
        recommend_exercises(workout)
        return_or_exit
    when "Add Exercise\n"
        add_exercise
        return_or_exit
    when "Add Workout\n"
        create_workout
        return_or_exit
    when "Week Schedule\n"
        puts "prints out week"
        return_or_exit
    when "Motivational Quote\n"
        random_quote
        return_or_exit
    when "Exit\n"
        puts " ----------------------------------------------"
        puts " Thank you for using Fitiron have a greate day!"
        puts " ----------------------------------------------\n\n"
    end
end

def return_or_exit
    prompt = TTY::Prompt.new
    input = prompt.select("\n", ["Return to Main Menu", "Exit\n"])
    (input == "Return to Main Menu")? menu : nil
    puts " ----------------------------------------------"
    puts " Thank you for using Fitiron have a greate day!"
    puts " ----------------------------------------------\n\n"
end