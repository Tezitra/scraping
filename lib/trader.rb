require 'nokogiri'
require 'open-uri'

page=Nokogiri::HTML(open("https://coinmarketcap.com/"))
indextab= 0		
coins = []		
pricecoins = []
	page.xpath('//a[@class="link-secondary"]/text()').each do |x|
		coins << x.text
end
	page.xpath('//a[@class="price"]/text()').each do |y|
		pricecoins << y.text
end
hashcoins = Hash[coins.zip(pricecoins)]
puts hashcoins
