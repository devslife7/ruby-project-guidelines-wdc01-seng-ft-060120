require_relative '../config/environment'
require_relative '../lib/command_line_interface'

app = Fitiron_app.new

app.welcome
app.login_or_setup
app.menu

# set dificulty level
# keep track of created workout and exercises
# create a weekly schedule for user