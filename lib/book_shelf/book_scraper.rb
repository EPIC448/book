require "open-uri"
require 'pry'

class Book_scraper #this was changed

  #shift Q to get back in pry

  def self.scrape_genre
    doc = Nokogiri::HTML(open("http://books.toscrape.com"))
    nested_genres = []
    doc.search("ul.nav.nav-list ul a").map do |container|
    genre = container.text.strip     #works perfect
    url = container.values           #works perfect
    nested_genres << {genre: genre, book_url: url}
    url = url[0]
    # self.scrape_book(url)
    end
    nested_genres
  end
#  ^^^^ the above is complete^^^



  def self.scrape_book(book_url)  #we need to remove []
    # turn ["catalogue/category/books/travel_2/index.html"] => "catalogue/category/books/travel_2/index.html"
 
    doc = Nokogiri::HTML(open(book_url))
    #  we need to add the orginal url + semi scraped book_url
    pages = [ ]
      doc.search("li.col-xs-6.col-sm-4.col-md-3.col-lg-3").map do |box|
      name = box.css("h3 a").text
      price = box.css("p.price_color").text
      book_description = true
      product_information = true
      pages << {name: name, book_description: book_description, product_information: product_information, price: price}
    end
      pages  #it works when when called in the   "def self.scrape_genre"
  end
  
end
