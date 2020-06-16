require_relative '../config/environment'
require_relative '../lib/command_line_interface'
require_relative '../lib/assignments'

require 'tty-prompt'


welcome

greet_user

prompt = TTY::Prompt.new

##input = prompt.select("Whats Your Name?", %w(Login Register Help))


# puts input
# if user_log_in == "1"
#     log_in
# end


level = user_level
assign_workout(level)
