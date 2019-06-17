class Category
  attr_accessor :title, :category_url, :category_extension, :patron
  
  @@all = []
  
  def initialize(category_hash)
    category_hash.each{|key, value| self.send(("#{key}="), value)}
    @patron = patron
    @@all << self
    binding.pry
  end
  
  def self.list
    @@all.each.with_index(1){|category, index| puts "Type #{index} to select #{category.title}."}
  end
  
  
  
end