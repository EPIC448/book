require "open-uri"
require 'pry'

class Book_scraper #this was changed


  attr_accessor :name, :url

  @@nested_genres = []

  @@pages = []
  #shift Q to get back in pry

  def self.scrape_genre
    doc = Nokogiri::HTML(open("http://books.toscrape.com"))
    doc.search("ul.nav.nav-list ul a").map do |container|
      genre = Book_scraper.new
      genre.name = container.text.strip     #works perfect
      genre.url = "http://books.toscrape.com/#{container.values.join}"   #works perfect
      @@nested_genres << genre
    end
    @@nested_genres # class variable
  end
#  ^^^^ the above is complete^^^

def self.all_genres
  @@nested_genres
end

def self.find_genre(input)
  @@nested_genres[input-1]
end

def self.scrape_genre_books(genre)
  doc = Nokogiri::HTML(open("#{genre.url}"))
  #TODO: scrape the genre page
  doc.search("ul.nav.nav-list ul a").map do |container|
    genre_book = Book_scraper.new
    genre_book.name = container.text.strip     #works perfect
    genre_book.url = "http://books.toscrape.com/#{container.values.join}"   #works perfect
    @@nested_genres << genre
  end
  @@nested_genres
end

  def self.scrape_book(all_genres)  #line 26 .. get the genre_book.url... that where you get your info..

    doc = Nokogiri::HTML(open(all_genres))
    #  we need to add the orginal url + semi scraped book_url
    doc.search("div.page_inner").map do |box|
       name = box.css("h1").text #done
       price = box.css("p.price_color").text
       url = box.css("h3 a")
      #TODO scrape url -> doc_2 = Nokogiri::HTML(open(url))
      binding.pry

      # need to get the description and product_information
      book_description = box.css("p").text
      product_information = true
      @@pages << {name: name, book_description: book_description, product_information: product_information, price: price}
    end
      @@pages  #it works when when called in the   "def self.scrape_genre"
    end


    def self.all_pages
      @@pages
    end
  
end
