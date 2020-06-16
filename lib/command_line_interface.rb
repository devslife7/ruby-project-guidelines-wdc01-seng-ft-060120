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
        puts "Welcome, #{name}!"
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
    input = prompt.select("Choose Your Level:", %w(1.Beginner 2.Intermediate 3.Advanced 4.Pro))

end

def get_workout(user)
    # gets workout for that user
    ##if Level == beginner return beginner workout
    ##if Level == 
end