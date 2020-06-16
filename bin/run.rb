require_relative '../config/environment'
require_relative '../lib/command_line_interface'
require_relative '../lib/assignments'


welcome

num = user_log_in
puts num
if num == 1
    puts "enters the if statement"
    log_in
end


# level = user_level
# assign_workout(level)
