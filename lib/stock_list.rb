class Stock_list
  attr_accessor :category, :patron, :title
  @@all = []
  def initialize (patron, category_index, hash)
    hash.each{|key, value| self.send(("#{key}="), value)}
    @patrons = []
    @patrons << patron
    @category = Category.all[category_index]
    @@all << self
  end
  
  def find_or_create_by_title(title, patron, category_hash)
    self.find_by_title(title) || self.new(patron, category_index, hash)
  end
  
  def self.top_9(category_input)
    Scraper.scrape_best_and_worst_performing(Category.all[category_input - 1].category_url)[1..9].each.with_index(1){|company_hash,  index| puts "#{index}. #{company_hash[:title]} has a percent change of #{company_hash[:percent_change]}"}
  end
  def self.bottom_9(category_input)
    Scraper.scrape_best_and_worst_performing(Category.all[category_input - 1].category_url)[10..18].each.with_index(1){|company_hash,  index| puts "#{index}. #{company_hash[:title]} has a percent change of #{company_hash[:percent_change]}"}
  end
  def self.all_stocks_by_category(category_input)
    Scraper.scrape_full_company_lists(Category.all[category_input - 1].category_url).each.with_index(1) {|company, index| puts "#{index}. #{company[:title]} has a percent change of #{company_hash[:percent_change]}"}
  end
end

puts "Stock_list loaded"