require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'bundler'
@email = { :name => "",:emails => ""}
@n =1


def getEmail(url)
    Bundler.require
    session = GoogleDrive::Session.from_service_account_key("client_secret.json")
    spreadsheet = session.spreadsheet_by_title("Emails")
    worksheet = spreadsheet.worksheets.first
    @n += 1
    page = Nokogiri::HTML(open(url))
    @email[:name] = page.css('h1').text
    worksheet[@n, 1] = page.css('h1').text
    page.css("font").each do |node|
      if node.text.include? "@"
        @email[:emails] = node.text
        worksheet[@n, 2] = node.text
      end
    end
    puts @email
    worksheet.save
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
