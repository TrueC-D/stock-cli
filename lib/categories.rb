class Category
  attr_accessor :title, :category_url, :category_extension, :patron
  
  @@all = []
  
  def initialize(category_hash)
    category_hash.each{|key, value| self.send(("#{key}="), value)}
    @patron = patron
    @@all << self
    binding.pry
  end
  
  dat
  
  
end