require 'tty-prompt'
require 'open-uri'
require 'net/http'
require 'json'

class Interface 
    attr_reader :prompt
    
    def initialize()
        @prompt = TTY::Prompt.new(active_color: :magenta)
    end
end

def welcome
    pastel = Pastel.new
    font = TTY::Font.new(:standard)
    puts pastel.cyan(font.write("Welcome To Fit Iron")) 
end

def login_or_setup
    puts "What's you name?"
    input = gets.chomp.capitalize
    user_exits?(input)

    if User.find_by(username: input) != nil
        puts "\nWelcome back #{input}"
        sleep(2)
    else
        puts "\nWelcome new user"
        sleep(1)
        puts "\nLets add you to our database"
        sleep(2)
        bar = TTY::ProgressBar.new("\nSaving User ... [:bar]", total: 25)
        30.times do
            sleep(0.1)
            bar.advance(1)
        end
        puts "\nComplete!"
        sleep(0.5)
        user = User.create(username: input)
        puts "Successfully added #{user.username} to User table"
        sleep(3)
    end
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
    input = prompt.select(" Choose Your Level:", %w(Beginner Intermediate Advanced Pro))
end

# prompts and returns the users selected workout
def user_workout
    prompt_array = ["Arms\n", "Legs\n", "Chest\n", "Back\n"]
    prompt = TTY::Prompt.new
    prompt.select(" What would you like to work on today:\n", prompt_array).chop
end

def recommend_exercises(user_workout)
    workout = Workout.find_by(title: user_workout)
    
    list = workout.exercises.collect do |exercise|
        exercise.title
    end

    puts " Your recommended workouts are: #{list.join(', ')}"
end

def add_exercise
    workout_title_column_values = Workout.select(:title).map(&:title).uniq
       
    prompt = TTY::Prompt.new
    workouts_to_edit = prompt.multi_select(" Select workouts to add exercise\n", workout_title_column_values)
    
    puts " Add exercises separated by commas: (exercise1, exercise2, exercise3)"
    new_exercises = gets.chomp()
    user_exits?(new_exercises)
    
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

    puts " Success!"
    puts " We have succesfully added #{new_exercises.join(", ")}."
    puts " to the following workout(s): #{workouts_to_edit.join(", ")}"
end

def add_workout
    puts " Name the workout you would like to create:"
    user_workout = gets.chomp.capitalize
    user_exits?(user_workout)
    puts " What exercises would #{user_workout} workout have: (exercise1, exercise2, exercise3, exercise4)"
    user_exercises = gets.chomp
    user_exits?(user_exercises)
    user_exercises = user_exercises.split(", ")

    created_workout = Workout.create(title: user_workout)

    user_exercises.each do |exercise|
        created_exercise = Exercise.create(title: exercise)
        Workoutexercise.create(workout_id: created_workout.id, exercise_id: created_exercise.id)
    end

    puts " Success!"
    puts " We have succesfully added #{user_exercises.length} new exercise(s) to #{user_workout} << #{user_exercises.join(", ")}"
end

def random_quote
    url = "https://type.fit/api/quotes"
    # url = "https://www.bulkhackers.com/wp-json/bulk-hackers/get-quotes"
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    response.body
    json = JSON.parse(response.body)

    random_number = rand(1600)

    if json[random_number]["author"] == nil
        json[random_number]["author"] = "Someone Said This"
    end

    puts "\n\n\t\t\t\"#{json[random_number]["text"]}\"\n\n"
    puts "\t\t\t\t- #{json[random_number]["author"]}\n\n\n\n"
end

def browse_workouts_and_exercises
    prompt = TTY::Prompt.new
    input = prompt.select(" Choose what to browse:\n", ["Workouts\n", "Exercises\n", "Users\n"])
    input = input.chop
    if input == "Workouts"
        puts " Current list of Workouts:\n\n"

        workouts_array = Workout.select(:title).map(&:title).uniq
        workouts_array.each do |ex|
            puts "  #{ex}"
        end

        # puts "  #{Workout.select(:title).map(&:title).uniq.join(", ")}"
    elsif input == "Exercises"
        puts " Current list of Exercises:\n\n"
        exercises_array = Exercise.select(:title).map(&:title).uniq
        exercises_array.each do |ex|
            puts "  #{ex}"
        end

        # puts "  #{exercises_array.join(", ")}"
    elsif input == "Users"
        puts " Current list of Users:\n\n"
        users_array = User.select(:username).map(&:username).uniq
        users_array.each do |user|
            puts "  #{user}"
        end

        # puts "  #{exercises_array.join(", ")}"
    end
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

    prompt_array = ["Get Workout\n", "Add Exercise\n", "Add Workout\n", "Browse Data\n", "Week Schedule\n", "Motivational Quote\n", "Exit\n"]
    prompt = TTY::Prompt.new
    input = prompt.select("\n\n Main menu:\n", prompt_array) # %w(Get_Workout add_exercise add_workout look_week_schedule motivational_quote exit))

    case input.chop
    when "Get Workout"
        workout = user_workout
        recommend_exercises(workout)
        return_or_exit
    when "Add Exercise"
        add_exercise
        return_or_exit
    when "Add Workout"
        add_workout
        return_or_exit
    when "Week Schedule"
        puts "prints out week"
        return_or_exit
    when "Motivational Quote"
        random_quote
        return_or_exit
    when "Browse Data"
        browse_workouts_and_exercises
        return_or_exit
    when "Exit"
        exit_message
    end
end

def return_or_exit
    prompt = TTY::Prompt.new
    input = prompt.select("\n", ["Return to Main Menu", "Exit\n"])
    if input == "Return to Main Menu"
        menu 
    elsif input == "Exit\n"
        exit_message
    end
end

def user_exits?(command)
    if command.downcase == "exit"
        exit_message    
        Kernel.exit
    end
end

def exit_message
    puts "\n ----------------------------------------------"
    puts " Thank you for using Fitiron have a greate day!"
    puts " ----------------------------------------------\n\n"
end