# require_relative './config/environment'
require 'pry'

class Scraper
  def self.base_url
    "http://bigcharts.marketwatch.com"
  end
  
  def self.get_page (page = "http://bigcharts.marketwatch.com/industry/bigcharts-com/default.asp")
    Nokogiri::HTML(open(page))
  end
  
  def self.scrape_for_categories
    category_arr = []
    get_page.css("div.section ul a").each do |category|
      category_hash = {}
      category_hash[:title] = category.text
      category_hash[:category_extension] = category.attribute("href").value
      category_hash[:category_url] = base_url + category_hash[:category_extension]
      category_arr << category_hash
    end
    category_arr
  end
  
  def self.scrape_best_and_worst_performing(category_url)
    category = get_page((category_url).gsub("default", "focus"))
    company_arr = []
    category.css("table.stocks tbody tr").each do |company|
        company_hash = {}
        company_hash[:company_name] = company.css("td.name-col").text
        company_hash[:percent_change] = company.css("td.percent-col").text
        company_arr << company_hash
    end
    company_arr
  end
  
  def self.full_list_collect(category_url)
    category_url_new = category_url.gsub("default", "stocklist")
    list_arr = [category_url_new]
    category = get_page(category_url_new)
    category.css("div.paging ul a").each{ |url| list_arr << (base_url + url.attribute("href").value)}
    list_arr
  end
  
  def self.scrape_full_company_lists(category_url)
    full_list = []
    full_list_collect(category_url).each do |url|
      get_page(url).css("table.stocks tbody tr").each do |company|
        company_hash = {}
        company_hash[:company_name] = company.css("td.name-col").text
        company_hash[:company_chart_extension] = company.css("td.chart-col a").attribute("href").value
        company_hash[:percent_change] = get_page(base_url+(company_hash[:company_chart_extension])).css("div.important").text.split("\r\n").last.to_s.strip
        full_list << company_hash
      end
    end
    full_list
  end
end
  
  puts "Scraper Loaded"