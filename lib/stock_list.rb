class Stock_list
  attr_accessor :category, :patron
  @@all = []
  def initialize (patron)
    @title
    @percent_change
    @@all 
  end
  
  def self.top_9(category_input)
    (1..9)Scraper.scrape_best_and_worst_performing(Category.all[category_input - 1].category_url).each.with_index(1){|company_hash,  index| puts "#{index}. #{company_hash[:title]} has a percent change of #{company_hash[:percent_change]}"}
  end
  def self.bottom_9(category_input)
    (10..18)Scraper.scrape_best_and_worst_performing(Category.all[category_input - 1].category_url).each.with_index(1){|company_hash,  index| puts "#{index}. #{company_hash[:title]} has a percent change of #{company_hash[:percent_change]}"}
  end
  def self.all_stocks_by_category(category_input)
    Scraper.scrape_full_company_lists(Category.all[category_input - 1].category_url).each.with_index(1) {|company, index| puts "#{index}. #{company[:title]} has a percent change of #{company_hash[:percent_change]}"}
  end
end

puts "Stock_list loaded"