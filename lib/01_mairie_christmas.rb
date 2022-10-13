require 'rubygems'
require 'nokogiri' 
require 'open-uri'



def get_townhall_email(townhall_url)
    #page_avernes = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/95/aver"))
    page = Nokogiri::HTML(URI.open("townhall_url"))  
    email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
    return email
end
#puts get_townhall_email(0)


def get_townhall_urls
    page = Nokogiri::HTML(URI.open('http://annuaire-des-mairies.com/val-d-oise.html'))
    list_of_urls = []
    page.xpath('//a[contains(@class, "lientxt")]').each do |town|
        
      list_of_urls << get_townhall_email(town['href'])
    end
    return list_of_urls
end

puts get_townhall_urls

def get_townhall_name
    page = Nokogiri::HTML(URI.open('http://annuaire-des-mairies.com/val-d-oise.html'))
    list_of_towns = []
    page.xpath('//a[contains(@class, "lientxt")]').each do |town|
    list_of_towns << town.text
    end
    return list_of_towns
  end

  #puts get_townhall_name


=begin
  

  def create_final_array
    list_of_towns = get_townhall_name
    list_of_urls = get_townhall_urls
    final_array = []
    number_of_town = list_of_towns.length - 1
  
    for i in 0..number_of_town 
      townhall_url = list_of_urls[i].sub('.', 'http://annuaire-des-mairies.com')
      final_array << {list_of_towns[i]=> get_townhall_email(townhall_url)}
    end
    return final_array
  end

puts create_final_array
=begin
page.css('./html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]]').each do |mail|
    mails << mail.text
    #names.push(name.text)
end

puts mails.inspect
=end


//*[@id="voyance-par-telephone"]/table/tbody/tr[2]/td/table/tbody/tr


#Récupèration de l’e-mail d'une mairie à partir de l'URL de mairies, par exemple celle de Avernes.
#
#end

=begin
require 'nokogiri'
require 'open-uri'

def get_townhall_email(townhall_url)
  page = Nokogiri::HTML(URI.open(townhall_url))
  page.xpath('/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]').text
end
 
def get_townhall_urls
  page = Nokogiri::HTML(URI.open('http://annuaire-des-mairies.com/val-d-oise.html'))
  list_of_urls = []
  page.xpath('//a[contains(@class, "lientxt")]').each do |town|
    list_of_urls << town['href']
  end
  return list_of_urls
end

def get_townhall_name
  page = Nokogiri::HTML(URI.open('http://annuaire-des-mairies.com/val-d-oise.html'))
  list_of_towns = []
  page.xpath('//a[contains(@class, "lientxt")]').each do |town|
  list_of_towns << town.text
  end
  return list_of_towns
end

def create_final_array
  list_of_towns = get_townhall_name
  list_of_urls = get_townhall_urls
  final_array = []
  number_of_town = list_of_towns.length - 1

  for i in 0..number_of_town 
    townhall_url = list_of_urls[i].sub('.', 'http://annuaire-des-mairies.com')
    final_array << {list_of_towns[i]=> get_townhall_email(townhall_url)}
  end
  return final_array
end

print create_final_array
=end