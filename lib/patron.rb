class Patron
  attr_accessor :username, :password, :stocks
  @@all = []
  
  def initialize(username, password)
    @username = username
    @password = password
    @stocks = []
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.find_by(username)
    self.all.find{|element| element.username == username}
  end
  
  def display_stocks
    self.stocks.each.with_index{|element, index| puts "#{index}. #{element}"}
  end
  def categories(stock)
    
  end
end

puts "Patron Loaded"