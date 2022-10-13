require 'nokogiri'
require 'open-uri'

def crypto_collect
  crypto_names = []
  crypto_prices = []
  source = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))
  source.xpath('//a[contains(@class,"cmc-table__column-name--name cmc-link")]').each do |row|
    crypto_names.push(row.text)
  end

  source.xpath('//tr//td[5]').each do |row|
    crypto_prices.push(row.text)
  end
  
  a = []
  crypto_names.length.times do |i|
    h = {crypto_names [i] => crypto_prices [i]}
    a.push(h)
  end
  
  return a

end