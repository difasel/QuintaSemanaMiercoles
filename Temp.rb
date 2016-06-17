require 'net/http'
require 'nokogiri'
require 'open-uri'

uri_str = 'http://www.codea.mx'
# html = open(url_user)

# doc = Nokogiri::HTML(File.open(html))

# p doc.css('li.nav-item a').map { |link| link['href'] }
#'http://www.codea.mx'

def fetch(uri_str)
# Must be somedomain.net instead of somedomain.net/, otherwise, it will throw exception.
url = URI.parse(URI.encode(uri_str.strip))
  puts url

  # #get path
   headers = {}
   req = Net::HTTP::Get.new(url.path,headers)
  #start TCP/IP
  response = Net::HTTP.start(url.host,url.port) { |http|
        http.request(req)
  }

end

response = fetch("http://www.codea.mx")
puts response
noko = Nokogiri::HTML(response.body)
puts noko