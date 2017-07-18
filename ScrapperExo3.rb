require 'rubygems'
require 'nokogiri'
require 'open-uri'

def fun()
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/ableiges.html"))
  puts page.css('h1').text


end

fun()
