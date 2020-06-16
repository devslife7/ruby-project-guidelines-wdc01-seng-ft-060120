require 'tty-prompt'

def welcome
    puts "Welcome to the IronFit/Fitiron"
    
    puts ",--.   ,--.       ,--.                                    ,--.             ,------.,--.,--------.,--.,------.  ,-----. ,--.  ,--.   "
    puts "|  |   |  | ,---. |  | ,---. ,---. ,--,--,--. ,---.     ,-'  '-. ,---.     |  .---'|  |'--.  .--'|  ||  .--. ''  .-.  '|  ,'.|  |   "
    puts "|  |.'.|  || .-. :|  || .--'| .-. ||        || .-. :    '-.  .-'| .-. |    |  `--, |  |   |  |   |  ||  '--'.'|  | |  ||  |' '  |   "
    puts "|   ,'.   |\   --.|  |\ `--.' '-' '|  |  |  |\   --.      |  |  ' '-' '    |  |`   |  |   |  |   |  ||  |\  \ '  '-'  '|  | `   |   "
    puts "'--'   '--' `----'`--' `---' `---' `--`--`--' `----'      `--'   `---'     `--'    `--'   `--'   `--'`--' '--' `-----' `--'  `--'   "
end
    
def greet_user
        puts "Hello! Whats Your Name?"
        name = gets.chomp()
        puts "Welcome, #{name.capitalize}!"
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

def user_level
    prompt = TTY::Prompt.new
    input = prompt.select("Choose Your Level:", %w(Beginner Intermediate Advanced Pro))
end

def user_workout
    prompt = TTY::Prompt.new
    input = prompt.select("What would you like to work on today:", %w(Arms Legs Chest Back))

    # gets workout for that user
    # if Level == beginner return beginner workout
end