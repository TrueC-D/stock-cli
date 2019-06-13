require "bundler/setup"
require "stock/cli"

require "pry"
Pry.start

require "irb"
IRB.start(__FILE__)

puts "Environment Loaded"