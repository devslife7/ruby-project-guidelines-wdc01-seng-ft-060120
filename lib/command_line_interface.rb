def welcome
    puts "Welcome to the IronFit/Fitiron"
end

def user_log_in
    puts "1. Log in"
    puts "2. Register"
    input = gets.chomp()
end

def log_in
    puts "Enter username"
    username = gets.chomp()
    puts "Enter password"
    password = gets.chomp()
    log_in_validation(username, password)
end

def get_workout(user)
    # gets workout for that user
end

def log_in_validation(username, password)
    # validates user return true/false
end

def register
    puts "What would be your user name"
    username = gets.chomp()
    puts "Create Password"
    password = gets.chomp()
end

def user_level
    puts "What is your level of fitness?"
    puts "1. Begginer"
    puts "2. Intermediate"
    puts "3. Advanced"
    puts "4. Pro"
    input = gets.chomp()
end
