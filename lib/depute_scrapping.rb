require 'rubygems'
require 'nokogiri'
require 'open-uri'

def url_base 
    urlpage = "http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"
    doc = Nokogiri::HTML(open(urlpage))
end


def search_href
    href_array = []
    href = url_base.xpath('//*[@id="deputes-list"]/div/ul/li/a').each do |i|
        href_array << i['href']
    end
return href_array
end




def search_email(array) 
    depute_email_array = []
    array.first(20).each do |city|  
        city_url = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr#{city}"))
        email = city_url.css('#haut-contenu-page > article > div.contenu-principal.en-direct-commission.clearfix > div > dl > dd:nth-child(8) > ul > li:nth-child(2) > a')
        depute_email_array << email.text
    end
    
return depute_email_array

end

# Array qui contient que les prénoms des députés
def get_firstnames
    firstnames = Array.new
    page = url_base
    page.css("div#deputes-list li a[href]").each {|n| firstnames << n.text.gsub("M. ","").gsub("Mme ","").split(' ').first}
    return firstnames
  end

  
  # Array qui contient que les noms des députés
  def get_lastnames
    lastnames = Array.new
    page = url_base
    page.css("div#deputes-list li a[href]").each {|n| lastnames << n.text.gsub("M. ","").gsub("Mme ","").split(' ').drop(1).join(" ")}
    return lastnames
  end

  def depute_scraper
    mail = search_email(search_href)
    firstname = get_firstnames
    secondname = get_lastnames

    array = []
   
    
    (0..-1).each do |x|
      new_hash = {}
      new_hash["first_name"] = firstname[x] 
      new_hash["last_name"] = secondname[x] 
      new_hash["email"] = mail[x] 
      array << new_hash   
    end 

    print array
  end

  depute_scraper