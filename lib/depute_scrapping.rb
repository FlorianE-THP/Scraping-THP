require 'rubygems'
require 'nokogiri'
require 'open-uri'

def url_base 
    urlpage = "http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"
    doc = Nokogiri::HTML(open(urlpage))
end

def search_depute
    depute_array = []
    fullname = url_base.xpath('//*[@id="deputes-list"]/div/ul/li/a/text()').each { |name| depute_array << name.text.gsub('M.', '').gsub('Mme', '').strip }
    
return depute_array
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

def zip_tout_ca
    name = search_depute
    email = search_email(search_href)
    hash = Hash[*name.zip(email).flatten]
   print hash
end

zip_tout_ca