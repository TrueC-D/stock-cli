class Cli
  def call
    
    start
  end
  
  def self.start
    puts "Within this platform we store the most recent percent change for stocks. What would you like to do?"
    menu_1
  end
  
  def self.menu_1
    puts "To search for general stock information, type 1"
    puts "To buy stock type 2"
    puts "To sell stock type 3"
    puts "Or view information regarding your personal stocks, type 4"
    
    input = gets.strip
    
    case input
    when "1"
      
    when "2"
      
    when "3"
      
    when "4"
      
    else
      puts "Invalid input"
      menu_1
    end
  end
end


# require "stock/cli/version"


# module Stock
#   module Cli
#     class Error < StandardError; end
#     # Your code goes here...
#   end
# end

puts "Command Line Interface Loaded"