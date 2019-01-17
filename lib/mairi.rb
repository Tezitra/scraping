require 'nokogiri'
require 'open-uri'

def get_townhall_email(townhall_url)

	doc = Nokogiri::HTML(open(townhall_url))

	doc.search('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |link|
  		return link.content
	end


end


def get_townhall_urls
	town=[]
	mail=[]	
	hash_contact={}
	i=0
	page = Nokogiri::HTML(open('http://www.annuaire-des-mairies.com/val-d-oise.html'))
	page.xpath('//a[@class="lientxt"]/@href').each do |x| 
	town << x.text
	end
	j=town.length
	while i<j
		mail[i]= get_townhall_email( "http://annuaire-des-mairies.com/#{town[i]}")
	
		i+=1	
	end
	
	hash_contact=[town.zip(mail)]
	
end
puts get_townhall_urls