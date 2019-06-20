class Category
  attr_accessor :title, :category_url, :category_extension
  
  @@all = []
  
  def initialize(category_hash)
    category_hash.each{|key, value| self.send(("#{key}="), value)}
    @@all << self
  end
  
  def self.list
    @@all.each.with_index(1){|category, index| puts "Type #{index} to select #{category.title}."}
  end
  
  def self.all
    @@all
  end
  
  def patrons
    self.stocks.collect {|stock| stock.patrons}
  end
  
  def stocks
    Stock_list.all.select{|stock| stock.category == self}
  end
  
end

puts "Category Loaded"