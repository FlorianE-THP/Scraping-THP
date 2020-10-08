require 'rubygems'
require 'nokogiri'
require 'open-uri'

#Methode de base avec le lien qui ouvre le val d'oise.
def base_url
    urlpage = "http://annuaire-des-mairies.com/val-d-oise.html"
    doc = Nokogiri::HTML(open(urlpage))
end

#On récupère toutes les villes du Val d'oise et on les mets dans un tableau 
def search_ville
    city_array = []
    citys = base_url.css('a.lientxt[href]').each {|city| city_array << city.text.downcase.gsub(' ', '-')}
    return city_array
end


# On récupère les mails de chaque ville
def search_email(array)
    # Je crée le hash
    city_email_hash = {}
    #Array c'est le paramètre qui au final sera search_ville
    array.each do |city| 
        #On fait ça avec chaque ville
        city_url = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/#{city}.html"))
        #Je vais chercher en CSS mon mail qui est à chaque fois le 7ème TD
        email = city_url.css('td')[7]
        # Et je met tout ça dans mon hash
        city_email_hash[city] = email.text
    end
    return city_email_hash.each_slice(1).map(&:to_h)
end

puts "Bouge pas, ça arrive"
puts search_email(search_ville)

