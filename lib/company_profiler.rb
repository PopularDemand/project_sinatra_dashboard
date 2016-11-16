require 'httparty'
require 'pp'

ID = ENV["GLASSDOOR_ID"]
KEY = ENV["GLASSDOOR_KEY"]
IP = ENV["MY_IP"]
USER_AGENT = "Windows%20Chrome"

def build_url(terms)
  base_url = "http://api.glassdoor.com/api/api.htm?"
  parameters = "t.p=#{ID}&t.k=#{KEY}&userip=#{IP}&useragent=#{USER_AGENT}&format=json&v=1&action=employers"
  query = "&q=#{terms}"
  url = "#{base_url}#{parameters}#{query}"
end

url = build_url("Kane Partners")

p url

response = HTTParty.get(url)

pp response["response"]["employers"][0]["exactMatch"]

pp response["response"]["employers"][0]["cultureAndValuesRating"]

pp response["response"]["employers"][0]["featuredReview"]
