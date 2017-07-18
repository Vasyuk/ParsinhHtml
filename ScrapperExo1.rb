require 'rubygems'
require 'nokogiri'
require 'open-uri'
@email = { :name => "",:emails => ""}

def getEmail(url)
    page = Nokogiri::HTML(open(url))
    @email[:name] = page.css('h1').text
    page.css("font").each do |node|
      if node.text.include? "@"
        @email[:emails] = node.text
      end
    end
    puts @email
end

def getUrl()
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  links = page.css('tr').css('td').css('a')
  length = links.length - 1
  for n in (0..length)
    if links[n]["href"].include? "95"
      getEmail( "http://annuaire-des-mairies.com"+links[n]["href"])
    end
  end
end

getUrl()
