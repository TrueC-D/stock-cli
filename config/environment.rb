require "bundler/setup"
require 'open-uri'
# require "stock/cli"
# require 'rspec'

Bundler.require(:default, :development)

require_all './lib'
username = "daisies"
(username.gsub!(/\A"|"\Z/, '')) = Patron.new(username, "testing")
username2 = Patron.new(username2, "testing 2")
username3 = Patron.new(username3, "testing 3")

Patron.all
binding.pry

# Scraper.scrape_full_company_lists("http://bigcharts.marketwatch.com/industry/bigcharts-com/default.asp?symb=WSJMXUSAGRI")

# require_relative '../lib/stock_cli'
# require_relative '../lib/stocks/cli'
# require_relative '../lib/stocks/scraper'
# require_relative '../lib/stocks/version'

puts "Environment Loaded"