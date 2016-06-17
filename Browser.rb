
require 'net/http'
require 'nokogiri'
require 'open-uri'



class Page
  def initialize(url)
    @url = url
    html = open(@url)
    #p html
    @doc = Nokogiri::HTML(File.open(html))
  end

  def fetch!


    res = Net::HTTP.get_response(URI(@url))
    print res.body

  end

  def links

    num_links = profile_name = @doc.search(".nav-item > a").count
    for link in 0..num_links-1
      name_link = @doc.search(".nav-item > a")[link]
      name_link = name_link.inner_text
      real_link = @doc.css('li.nav-item a').map { |link| link['href'] }[link]
      name_link = real_link if name_link == ""  
      puts "\t#{name_link}: #{real_link}"
      
    end

  end

  def title

    profile_name = @doc.search("title").inner_text


  end
end

class Browser
  def run!

    url_user = 'http://www.codea.mx'
    new_url = Page.new(url_user)
    puts 
    puts "url> #{url_user}"
    puts "Fetching..."
    puts "Titulo: " + new_url.title
    puts "Links:"
    new_url.links
    puts "..."
    puts "url>"
    puts 
  end
end

Browser.new.run!






