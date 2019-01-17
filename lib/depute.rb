require 'nokogiri'
require 'open-uri'
mail = []
page= Nokogiri::HTML(open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=50&debut_deputes=0&fbclid=IwAR03r5bv7_QFH20M13S-j2qJ07j_CSlKICIFVjzNYzIcNzxKF1e-kNw5cbI#pagination_deputes"))
page.xpath('//a[@class="ann_mail"]/@href').select do |x|
mail << x.text.include?(".fr")
end
puts mail