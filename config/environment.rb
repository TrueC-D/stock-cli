require "bundler/setup"
require "stock/cli"
require 'open-uri'
require 'rspec'

Bundler.require

require "pry"
Pry.start

require "irb"
IRB.start(__FILE__)

puts "Environment Loaded"