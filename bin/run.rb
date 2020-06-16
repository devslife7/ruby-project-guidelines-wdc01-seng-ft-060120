require_relative '../config/environment'
require_relative '../lib/command_line_interface'
require_relative '../lib/assignments'

require 'tty-prompt'
# prompt = TTY::Prompt.new

welcome
greet_user
level = user_level
workout = user_workout
assign_workout(level, workout)

