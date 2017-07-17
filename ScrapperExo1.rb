require 'rubygems'
require 'nokogiri'
require 'open-uri'
@emails = Array.new
# PAGE_URL = "http://ruby.bastardsbook.com/files/hello-webpage.html"
# page = Nokogiri::HTML(open(PAGE_URL))
#
# puts page.css("title")[0].name   # => title
# puts page.css("title")[0].text   # => My webpage
#
# doc = Nokogiri::HTML(open("http://www.google.com/search?q=doughnuts"))
# 	doc.xpath('//h3/a').each do |node|
# 	  puts node.text
# 	end

def getEmail(url)
  page = Nokogiri::HTML(open(url))
  page.css("font").each do |node|
    if node.text.include? "@"
      @emails<<(node.text)
      puts node.text
    end
  end
end

def getUrl()
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  links = page.css("a")
  length = links.length - 2
  for n in (8..length)
    getEmail( "http://annuaire-des-mairies.com"+links[n]["href"])
  end
end

getUrl()
