require 'rubygems'
require 'nokogiri' 
require 'open-uri'

townhall_url = "https://www.annuaire-des-mairies.com/95/avernes.html"

def get_townhall_email(townhall_url)
    page = Nokogiri::HTML(URI.open(townhall_url))  
    email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
    return email
end
#puts get_townhall_email(townhall_url)


def get_townhall_urls
    page = Nokogiri::HTML(URI.open('http://annuaire-des-mairies.com/val-d-oise.html'))
    list_of_urls = []

    page.xpath('//a[contains(@class, "lientxt")]').each do |town|
        list_of_urls << town['href']
    end
    return list_of_urls
end

#puts get_townhall_urls


def get_townhall_name
    page = Nokogiri::HTML(URI.open('http://annuaire-des-mairies.com/val-d-oise.html'))
    list_of_towns = []

    page.xpath('//a[contains(@class, "lientxt")]').each do |town|
        list_of_towns << town.text
    end
    return list_of_towns
end

#puts get_townhall_name


  def hash_names_towns
    list_of_urls = get_townhall_urls
    list_of_towns = get_townhall_name
    list_of_names_towns = []
    number_of_town = list_of_towns.length - 1
  
    for i in 0..number_of_town 
      townhall_url = list_of_urls[i].sub('.', 'http://annuaire-des-mairies.com')
      list_of_names_towns << {list_of_towns[i]=> get_townhall_email(townhall_url)}
    end
    return list_of_names_towns
  end
  
  print hash_names_towns