require "bundler/setup"
require 'open-uri'
# require "stock/cli"
# require 'rspec'

Bundler.require(:default, :development)

require_all './lib'

username = "test"
username = Patron.new("test", "password")
binding.pry

# Scraper.scrape_full_company_lists("http://bigcharts.marketwatch.com/industry/bigcharts-com/default.asp?symb=WSJMXUSAGRI")

# require_relative '../lib/stock_cli'
# require_relative '../lib/stocks/cli'
# require_relative '../lib/stocks/scraper'
# require_relative '../lib/stocks/version'

puts "Environment Loaded"