# require_relative './config/environment'
require 'pry'

class Stock_cli::Scraper
  def base_url
    "http://bigcharts.marketwatch.com"
  end
  
  def get_page (page = "http://bigcharts.marketwatch.com/industry/bigcharts-com/default.asp")
    Nokogiri::HTML(open(page))
  end
  
  def scrape_for_category
    category_hash = {}
    get_page.css("div.section a").collect do |category|
      category_hash[:title] = category.text
      category_hash[:category_extension] = category.attribute("href").value
      category_hash[:category_url] = base_url + category_hash[category_extension]
    end
  end
  
  def scrape_best_performing(category_url)
    best_performing = {}
    category = get_page((category_url).gsub("default", "focus"))
    category.each.with_index
      best_performing[:company_name] = category.css("td.name-col").text
      best_performing[:percent_change] = category.css("td.percent-col").text
    end
  end
  
  def scrape_full_category_list(category_url)
    full_list = {}
    
    category = get_page((category_url).gsub("default", "stocklist"))
    category.css
    full_list[:company_name] = category.css("td.name-col").text
    full_list[:percent_change] = get_page(base_url+(category.css("td.chart-col attribute").attribute("href").value)).css("div.important")[1].text
  end
    
  industry/bigcharts-com/stocklist.asp?symb=WSJMXUSAGRI
  
  def test_scraper_all
    # get_page.css("div.section a").text == category title
    # get_page.css("div.section a").attribute("href").value =category_extension
    # url_base = "http://bigcharts.marketwatch.com"
    # category_url = url_base + category_extension
    
    # best_performing = get_page((category_url).gsub("default", "focus")) #=> goes to best performing stocks
    # best_performing.css("td.name-col").text #=> Company Name for best_performing page
    # best_performing.css("td.percent-col").text #=> Percent name for associated Company's stock on the best_performing page
    
    # full_list = get_page((category_url).gsub("default", "stocklist")) #=> goes to all stocks in category
    # full_list.css("td.name-col").text #=> Company Name for full_list page
    # full_list.css("td.chart-col attribute").attribute("href").value = chart_extension for full list company
    # chart = url_base + chart_extension
    # g_chart = get_page(chart)
    # g_chart.css("div.important")[1].text #=> percent change for company stock
    
    
    puts "inside the method"
    
  end
end

  # get % change of stocks upon entry of a number associated with the stock (possibly a number generated via each.with_index)
  #start with the general stock section so that users can select the category of stock, then get the percentages by listed stocks (needs to have 2 models/ be two levels deep).
  # Original page that has the categories leads to a sublink, click sub link then get to page with listed stocks.  Need to scrape 1) category names, category links on 1st page, 1.5) each.with_index, collect category names and let user select category by entering the associated index key.  Use .send method 2) main category link on 2nd page, 3) Stock names on 3rd page, 4) associate indecies with this name, and 4) % change for associated stock. 
  # def self.get_page #(page = "http://bigcharts.marketwatch.com/industry/bigcharts-com/default.asp")
  #   binding.pry
  #   # Nokogiri::HTML(open(page))
  # end
  #