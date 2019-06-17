class Patron
  attr_accessor :username, :password, :stocks
  @@all = []
  
  def initialize(username, password)
    @username = username
    @password = password
    @stocks = []
  end
  
  def self.all
    @@all
  end
  
  def categories(stock)
    
  end
end

puts "Patron Loaded"