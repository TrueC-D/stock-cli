require "bundler/setup"
require 'open-uri'
# require "stock/cli"
# require 'rspec'

Bundler.require(:default, :development)

# require_relative '../lib/stock_cli'
# require_relative '../lib/stocks/cli'
# require_relative '../lib/stocks/scraper'
# require_relative '../lib/stocks/version'

require_all './lib'

# require "pry"
# Pry.start

Scraper.scrape_best_and_worst_performing("http://bigcharts.marketwatch.com/industry/bigcharts-com/default.asp?symb=WSJMXUSHCR")

puts "Environment Loaded"