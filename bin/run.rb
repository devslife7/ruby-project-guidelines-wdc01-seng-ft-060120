require_relative '../config/environment'
require_relative '../lib/command_line_interface'
require_relative '../lib/assignments'

require 'tty-prompt'


welcome

prompt = TTY::Prompt.new

input = prompt.select("Choose your destiny?", %w(Scorpion Kano Jax))

puts input
# if user_log_in == 1
#     log_in
# end


# level = user_level
# assign_workout(level)
