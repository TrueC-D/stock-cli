class Patron
  attr_accessor :username, :password
  
  def initialize(username, password)
    @username = username
    @password = password
    @stocks = []
  end
  
  def categories(stock)
    
  end
end

puts "Patron Loaded"