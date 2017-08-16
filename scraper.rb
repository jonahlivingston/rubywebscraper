require 'HTTParty'
require 'Nokogiri'

class Scraper
  names = Array.new()
  offset = 20
  while names.length < 500 do
  doc = HTTParty.get("https://www.meetup.com/sfArts/members/?offset=#{offset}&sort=last_visited&desc=1")
  parse_page = Nokogiri::HTML(doc)
  jonah = parse_page.css(".memName")
  jonah.each{|x| names.push(x.text)}
  offset = offset + 20
    end
  print names
end
