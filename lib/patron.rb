require_relative '../config/environment'
class Patron
  attr_accessor :username, :password, :stocks, :company_name
  
  @@all = []
  
  def initialize(username, password)
    @username = username
    @password = password
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.find_by(username)
    self.all.find{|element| element.username == username}
  end
  
  def buy_stocks(buy_stocks_index_arr, list, category_index)
    buy_stocks_index_arr.each do|index| 
      Stock_list.find_by_name_or_create(list[index][:company_name], self, category_index, list[index])
    end
    
    # if Stock_list.find_by_name(:company_name).patrons.include?(self) == false
      
    #   Stock_list.find_by_name(:company_name).patrons << self
    # end
  end
  
  def sell_stocks(selling_stocks_index_arr)
    selling_stocks_index_arr.each{|index| self.stocks[index].patrons.delete(self)}
  end
  
  def display_stocks
    self.stocks.each.with_index(1){|element, index| puts "#{index}. #{element.company_name} with a percent change of #{element.percent_change}"
  end
  
  def categories
    self.stocks.collect {|stock| stock.category}
  end
  
  def stocks
    Stock_list.all.select{|stock| stock.patrons.include?(self)}
  end
end

puts "Patron Loaded"