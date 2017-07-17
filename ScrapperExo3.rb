require 'rubygems'
require 'nokogiri'
require 'open-uri'

def findInfo()
  page = Nokogiri::HTML(open("https://fr.wikipedia.org/wiki/Wikip%C3%A9dia:Accueil_principal"))
end

findInfo()
