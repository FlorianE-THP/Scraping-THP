
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'rspec'

def perform
# SOURCE
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   
cryptosource = page.xpath('//*[@id="__next"]/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[3]/div')
valuesource = page.xpath('//*[@id="__next"]/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/a')



# INIT DES TABLEAUX
cryptoarray = []
valuearray = []

# On rentre les valeurs des noms de crypto dans le tableau
cryptosource.each do |cryptosource|
  cryptoarray << cryptosource.text
end

# On rentre les valeurs des crypto dans le tableau
valuesource.each do |valuesource|
  valuearray << valuesource.text.delete('$'',').to_f
end

# On met tout ça dans un HASH
hashcrypto = Hash[*cryptoarray.zip(valuearray).flatten]
# On crée un nouveau tableau qui va contenir le Hash

print hashcrypto.each_slice(1).map(&:to_h)
return hashcrypto
end

perform