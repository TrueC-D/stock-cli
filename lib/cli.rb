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
    else
      puts "Invalid input"
      top_menu
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
      stock_list_menu(general_stock_menu)
    end
  end
  
  def self.personal_stock_menu(username)
    puts "What would you like to do?"
    puts "Type 1 to buy stocks."
    puts "Type 2 to sell stocks."
    puts "Type 3 to view your personal stock information."
    puts "To log out and return to the main menu type 00"
    
    input = gets.strip
    
    case input
    
    when "1"
      puts "What type of stocks would you like to buy?"
      stock_list_menu(personal_stock_menu(username), username)
    when "2"
      puts "What type of stocks would you like to sell?"
      stock_list_menu(personal_stock_menu(username), username)
    when "3"
      puts "Here is the information regarding your personal stocks"
      username_search(username).stocks
    when "00"
      start
    else
      puts "Invalid input."
      personal_stock_menu(username)
  end
  
  def self.stock_list_menu(origin, username = nil)
    puts "Type 1 to see all stocks in your category."
    puts "Type 2 to see the top nine stocks in your category."
    puts "Type 3 to see the bottom nine performing stocks in your category."
    puts "Type 0 to return to the previous menu."
    
    
    input = gets.strip
    
    case input
    
    when "1"
      Stock_list.all_stocks_by_category(input)
    when "2"
      Stock_list.top_9(input)
    when "3"
      Stock_list.bottom_9(input)
    when "0"
      origin
    else 
      puts "Invalid Input"
      stock_list_menu(origin, username = nil)
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
  
  def self.log_in
    puts "Please enter your username."
    username = gets.strip
    if username_search(username) == nil
      username_error
    else
      password_check(username)
    end
  end
  
  def self.username_search(username)
    Patron.all.find {|element| element.username == username}
  end
  
  def self.password_check (username)
    puts "Please enter your password."
      
    input = gets.strip
    
    if username_search(username).password == input
      puts "Welcome #{username}!"
      personal_stock_menu(username)
    else
      password_error(username)
    end
  end
  
  def self.username_error
    puts "The username you entered does not exist in our records.  Please type 1 to try again, type 2 to create a new account, or type 0 to return to the previous menu."
    
    input = gets.strip
    
    case input
    when "1"
      log_in
    when "2"
      create_new_patron
    when "0"
      start
    else 
      puts "Invalid Input."
      username_error
    end
  end
  
  def self.password_error(username)
    puts "The password you enetered is incorrect."
    puts "Type 1 to try again or type 0 to return to the previous menu."
    
    input = gets.strip
    
    case input
    when "1"
      password_check(username)
    when "0"
      start
    end
  end
  
  def self.create_new_patron
    puts "Please enter your desired username."
    
    username = gets.strip
    if username_search(username) == nil
      puts "Please create and enter a password for your account."
      password = gets.strip
      Patron.new(username, password)
      puts "Welcome #{username} to your new account!"
      personal_stock_menu(username)
    else 
      puts "Error. This user already exists."
      username_already_exists
  end
  
  def self.username_already_exists
    puts "The username you enetered already exists."
    puts "Type 1 to enter a new username or type 0 to return to the start menu."
    
    input = gets.strip
    
    case input
    when "1"
      create_new_patron
    when "0"
      start
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