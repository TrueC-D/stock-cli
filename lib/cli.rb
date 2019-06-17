class Cli
  
  def call
    Scraper.scrape_for_categories.each{|element| Category.new(element)}
    
    start
  end
  
  def self.start
    puts "Within this platform we store the most recent percent change for stocks. What would you like to do?"
    top_menu
  end
  
  def self.input
    gets.strip
  end
  
  def self.top_menu
    puts "To search for general stock information, type 1"
    puts "Type 2 to buy stock, sell stock, or view information regarding your personal stocks."
    
    input = gets.strip
    
    case input
    when "1"
      puts "What type of stock would you like to search for?"
      general_stock_menu
    when "2"
      puts "You will need to be logged in to access the requested information."
      log_in_or_create_menu
      puts "What type of stock would you like to buy?"
      general_stock_menu
    else
      puts "Invalid input"
      top_menu
    end
  end
  
  def self.log_in_or_create_menu
    puts "If your have an existing acount type 1 to log in. Otherwise type 2 to create a new account or type 0 to return to the previous menu."
    input = gets.strip
    
    case input
    when "1"
      log_in
    when "2"
      create_new_patron
    when "0"
      start
    else
      puts "Invalid input."
      log_in_or_create_menu
    end
  end
  
  def self.general_stock_menu
    puts "We have a wide selection of stock categories."
    Category.list
    puts "Type 0 to return to the preveious menu."
      
    input = gets.strip
      
    if input == "0"
      start
    elsif input.to_i > 0 && input.to_i <= scraper.all.length
      chosen_category = Category.all[input.to_i-1]
      puts "What would you prefer?"
      stock_list_menu
    end
  end
  
  def self.stock_list_menu
    puts "Type 1 to see all stocks in your category."
    puts "Type 2 to see the top nine stocks in your category."
    puts "Type 3 to see the bottom nine performing stocks in your category."
    puts "Type 0 to return to the preveious menu."
    
    input = gets.strip
    
    case input
    
    when "1"
      Stock_list.all_stocks_by_category(input)
    when "2"
      Stock_list.top_9(input)
    when "3"
      Stock_list.bottom_9(input)
    when "0"
      general_stock_menu
    else 
      puts "Invalid Input"
      stock_list_menu
    end
  end
  
  def self.log_in
    
  end
  
  def self.username_error
    
  end
  
  def self.password_error
    
  end
  
  def self.create_new_patron
    
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