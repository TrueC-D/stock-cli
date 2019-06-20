class Cli
  
  def 
    loading
    start
  end
  
  def self.loading
    Scraper.scrape_for_categories.each{|element| Category.new(element)}
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
  
  def self.personal_stock_menu(username)
    puts "What would you like to do?"
    puts "Type 1 to buy stocks."
    puts "Type 2 to view your personal stock information or view and sell stocks."
    puts "At any time, to log out and return to the main menu type 00"
    
    input = gets.strip
    
    case input
    
    when "1"
      puts "What type of stocks would you like to buy?"
      general_stock_menu(personal_stock_menu(username), username)
    when "2"
      display_and_sell_stocks(username)
      
    when "00"
      start
    else
      puts "Invalid input."
      personal_stock_menu(username)
  end
  
  def self.general_stock_menu(origin, username = nil)
    puts "We have a wide selection of stock categories."
    Category.list
    puts "Type 0 to return to the preveious menu."
      
    input = gets.strip
    category_input = input.to_i 
    if input == "0"
      origin
    elsif input == "00"
      start
    elsif category_input > 0 && category_input <= scraper.all.length
      category_index = category_input-1
      puts "What would you prefer?"
      stock_list_menu(general_stock_menu(origin, username), username, category_index)
    end
  end
  
  def self.stock_list_menu(origin, username = nil, category_index)
    puts "Type 1 to see all stocks in your category."
    puts "Type 2 to see the top nine stocks in your category."
    puts "Type 3 to see the bottom nine performing stocks in your category."
    puts "Type 0 to return to the previous menu."
    
    
    input = gets.strip
    
    case input
    
    when "1"
      list = Stock_list.all_stocks_by_category(category_index)
      if origin == general_stock_menu(personal_stock_menu(username))
        buy_stock(list)
      else
        list
      end
    when "2"
      list = Stock_list.top_9(category_index)
    when "3"
      Stock_list.bottom_9(category_index)
    when "0"
      origin
    when "00"
      start
    else 
      puts "Invalid Input"
      stock_list_menu(origin, username = nil)
    end
  end
  
  def self.display_and_sell_stocks(username)
    puts "Here is the information regarding your personal stocks"
    username_search(username).display_stocks
    sell_stocks?(username)
  end
  def self.stock_select(list)
  end
  
  def self.buy_stock(list)
        list #=> Stock_list.all_stocks_by_category(category_input)
        username_search(username).stocks << stock_select
  end

  def self.sell_stocks?(username)
    puts "Would you like to sell stocks?"
    puts "If yes, type 1, if no type 2."
    puts "Type 0 to return to your user menu."
    input = gets.strip
    case input
    when "1"
      stock_selling(username)
    when "2"
      personal_stock_menu(username)
    when "0"
      personal_stock_menu(username)
    when "00"
      start
    else 
      puts "Invalid input."
      sell_stocks?(username)
    end
  end
  
  def self.stock_selling(username)
    puts "For each stock you want to sell, please type the stock number separated by a comma."
    puts "Type 0 to return to the user menu."
    puts "Example:"
    puts "1. Stock A"
    puts "2. Stock B"
    puts "3. Stock C"
    puts "To sell Stock A and C, type: 1,3"
    
    username_search(username).stocks
    
    input = gets.strip
    
    input_arr = input.gsub(" ", "").split(",")
    
    if input == "0"
      personal_stock_menu(username)
    elsif input == "00"
      start
    elsif input_arr.any?{|element| element.to_i == false || element.to_i < 1 || element.to_i > username_search(username).stocks.length}
      puts "Invalid input. Please refer to example."
      stock_selling(username)
    else
      sell_stocks_indexes = input_arr.collect{ |element| element.to_i-1}
      username_search(username).sell_stocks(sell_stocks_indexes)
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