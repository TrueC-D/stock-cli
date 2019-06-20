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
  
  def buy_stocks(buy_stocks_index_arr, list, category_index)
    buy_stocks_index_arr.each do|index| 
      Stock_list.find_by_title_or_create(list[index][:title], self, category_index, list[index])
    end
    if Stock_list.find_by_title(title).patrons.include?(self) == false
      Stock_list.find_by_title(title).patrons << self
    end
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