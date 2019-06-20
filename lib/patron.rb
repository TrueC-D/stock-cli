class Patron
  attr_accessor :username, :password, :stocks
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
  
  def buy_stocks(buy_stocks_index_arr, list)
    
    buy_stocks_index_arr.each do|index| 
      list[index]
    # self.stocks.each{|stock| stock.patrons << list[index]}
    
    # def find_by_title_or_create(title, patron, category_hash)
    #   self.find_by_title(title) || self.new(patron, category_index, hash)
  #   end
  end
  
  def sell_stocks(selling_stocks_index_arr)
    selling_stocks_index_arr.each{|index| self.stocks[index].patrons.delete(self)}
  end
  
  def display_stocks
    self.stocks.each.with_index{|element, index| puts "#{index}. #{element}"}
  end
  
  def categories
    self.stocks.collect {|stock| stock.category}
  end
  
  def stocks
    Stock_list.all.select{|stock| stock.patrons.include?(self)}
  end
end

puts "Patron Loaded"