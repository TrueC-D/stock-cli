class Stock_cli::Scraper
  # get % change of stocks upon entry of a number associated with the stock (possibly a number generated via each.with_index)
  #start with the general stock section so that users can select the category of stock, then get the percentages by listed stocks (needs to have 2 models/ be two levels deep).
  # Original page that has the categories leads to a sublink, click sub link then get to page with listed stocks.  Need to scrape 1) category names, category links on 1st page, 2) main category link on 2nd page, 3) Stock names on 3rd page, 4) associate indecies with this name, and 4) % change for associated stock. 
  # def self.get_page #(page = "http://bigcharts.marketwatch.com/industry/bigcharts-com/default.asp")
  #   binding.pry
  #   # Nokogiri::HTML(open(page))
  # end
  def get_page (page = "http://bigcharts.marketwatch.com/industry/bigcharts-com/default.asp")
    binding.pry
  end
  
  # def test_scraper_all
  #   get_page
  #   binding.pry
  # end
end