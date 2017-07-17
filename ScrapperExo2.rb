require 'rubygems'
require 'nokogiri'
require 'open-uri'
@coinMarket = Array.new

def arrayPuch(hash)
  # hash = { :name => , :symbole => , :price => , :circulatingSupply => , :volume => , :oneH => , :twentyfourH => , :sevenD => }
  @coinMarket.push(hash)
end

def findInfo()
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

  positionCss = page.css(".text-center")
  nameCss = page.css(".no-wrap").css(".currency-name")
  symboleCss = page.css(".text-left")
  marketCapCss = page.css(".no-wrap").css(".market-cap").css(".text-right")
  priceCss = page.css(".no-wrap").css(".text-right")
  circulatingSupplyCss = page.css(".no-wrap").css(".currency-name")
  volumeCss = page.css(".no-wrap").css(".currency-name")
  oneHCss = page.css(".no-wrap").css(".currency-name")
  twentyfourHCss = page.css(".no-wrap").css(".currency-name")
  sevenDCss = page.css(".no-wrap").css(".currency-name")

  lengthposition = positionCss.length - 7
  lengthnameCss = nameCss.length - 1
  lengthmarketCap = marketCapCss.length - 1
  lengthsymboleCss = symboleCss.length - 1
  lengthpriceCss = priceCss.length - 1
  lengthcirculatingSupplyCss = circulatingSupplyCss.length - 1
  lengthvolumeCss = volumeCss.length - 1
  lengthoneHCss = oneHCss.length - 1
  lengthtwentyfourHCss = twentyfourHCss.length - 1
  lengthsevenDCss = sevenDCss.length - 1


  # for n in (4..lengthposition)
  #    puts position[n].text
  # end
  # for n in (0..lengthnameCss)
  #
  # end
  # for n in (2..lengthsymboleCss)
  #
  # end
  # for n in (0..lengthmarketCap)
  #    puts marketCapCss[n].text
  # end
  for n in (0..lengthpriceCss)
     puts priceCss[n].text
  end

end

findInfo()
