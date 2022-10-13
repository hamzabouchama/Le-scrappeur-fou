require 'rubygems'
# Les 2 gem utilisés ici sont :
require 'nokogiri' 
require 'open-uri'
#Nous avons egalement introduits d'autres gems dans Gemfile

page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))  
#puts page

def crypto_name(page)
    names = []
    #Autre methode 
    #doc.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[2]/div/a[1]').each do |node| //*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[2]/div/a[1]
    #puts node.text
    #end
    page.css('.cmc-table__column-name--symbol').each do |name|
        names << name.text
        #names.push(name.text)
    end
    return names
end

#puts names.inspect
#Le resultat est ["BTC", "ETH", "USDT", "USDC", "BNB", "XRP", "BUSD", "ADA", "SOL", "DOGE", "DOT", "MATIC", "DAI", "TRX", "SHIB", "WBTC", "UNI", "AVAX", "LEO", "LTC"] 
#or il y a encore des centaines de noms qui ne sont pris en compte !!!

def crypto_value(page)
    prices = []
    page.css('.cLgOOr').each do |price|
        prices << price.text
    end 
    return prices
    #puts prices.inspect
end

def result(names, prices)
    result_names_prices = Hash.new(0)
    result_names_prices = Hash[names.zip (prices)].to_a
    #result_names_prices['names'] = 'prices'

    puts result_names_prices.inspect

end

# méthode qui appelle mes méthodes
def perform(page)
    names = crypto_name(page)
    #puts names.inspect
    prices = crypto_value(page)
    #puts prices.inspect
    result(names, prices)
end
  
  perform(page)


#Pour aller plus loin
#Le site semble donner la reponse concernant la recuperation de l'ensemble des elements et non des 20 premiers
#La solution reside a les recuperer dans le fichier .json
#https://stackoverflow.com/questions/71142914/ruby-nokogiri-take-all-the-content

