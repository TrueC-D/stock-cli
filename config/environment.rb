require "bundler/setup"
require 'open-uri'
# require "stock/cli"
# require 'rspec'

Bundler.require(:default, :development)

require_relative '../lib/stock_cli'
require_relative '../lib/stocks/cli'
require_relative '../lib/stocks/scraper'
require_relative '../lib/stocks/version'

# require_all './lib'

# require "pry"
# Pry.start


puts "Environment Loaded"