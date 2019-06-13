require "bundler/setup"
require 'open-uri'
# require "stock/cli"
# require 'rspec'

Bundler.require(:default, :development)
require_all './lib'

# require "pry"
# Pry.start


puts "Environment Loaded"