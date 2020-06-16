# require 'bundler'
# Bundler.require

# ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
# require_all 'lib'

require "bundler/setup"
require "sinatra/activerecord"
Bundler.require
require_all 'app/models'

ENV['SINATRA_ENV'] ||= 'development'

ActiveRecord::Base.establish_connection(ENV['SINATRA_ENV'].to_sym)
ActiveRecord::Base.logger = nil
