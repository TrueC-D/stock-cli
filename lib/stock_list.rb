require_relative '../config/environment'
class Stock_list
  attr_accessor :category, :patrons, :title, :percent_change, :company_name
  @@all = []
  def initialize (patron, category_index, hash)
    hash.each{|key, value| self.send(("#{key}="), value)}
    @patrons = []
    @patrons << patron
    @category = Category.all[category_index]
    @@all << self
  end
  
  def self.all
    @@all
  end
  def patrons
    @patrons
  end
  def self.find_by_name(company_name)
    self.all.find{|element| element.company_name == company_name}
  end
  
  def self.find_by_name_or_create(company_name, patron, category_index, hash)
    self.find_by_name(company_name) || self.new(patron, category_index, hash)
  end
  
  def self.top_9(category_index)
    list = Scraper.scrape_best_and_worst_performing(Category.all[category_index].category_url)[1..9]
    list.each.with_index(1){|company_hash,  index| puts "#{index}. #{company_hash[:title]} has a percent change of #{company_hash[:percent_change]}"}
    list
  end
  def self.bottom_9(category_index)
    list = Scraper.scrape_best_and_worst_performing(Category.all[category_index].category_url)[10..18]
    list.each.with_index(1){|company_hash,  index| puts "#{index}. #{company_hash[:title]} has a percent change of #{company_hash[:percent_change]}"}
    list
  end
  def self.all_stocks_by_category(category_index)
    list = Scraper.scrape_full_company_lists(Category.all[category_index].category_url)
    list.each.with_index(1){|company, index| puts "#{index}. #{company[:title]} has a percent change of #{company[:percent_change]}"}
    list
  end
end

puts "Stock_list loaded"