# require "open-uri"
# require 'pry'

class Book::Book_scraper #this was changed


  attr_accessor :genre, :name, :book_description, :product_information, :price, :book_url

  @@nested_genres = []

  @@pages = []
  #shift Q to get back in pry


  def self.scrape_genre
    doc = Nokogiri::HTML(open("http://books.toscrape.com"))
    doc.search("ul.nav.nav-list ul a").map do |container|
      genre = Book_scraper.new
      genre.name = container.text.strip     #works perfect
      # genre.url = "http://books.toscrape.com/#{container.values.join}" 
      genre.url =  true
      # doc.search("div.page_inner").children
      #works perfect
      @@nested_genres << genre
    end
    @@nested_genres # class variable
  end



#  ^^^^ praticee^^^
# def self.scrape_genre
#   doc = Nokogiri::HTML(open("http://books.toscrape.com"))
#   doc.search("div.page_inner").map do |container|
    
#     container = Book_scraper.new
#     container.name = doc.search("a").text     
#     container.price = doc.search("p.price_color").text
    
#     # genre.url = "http://books.toscrape.com/#{container.values.join}" 
#     genre.url =   doc.search("div.page_inner").children
#     #works perfect
#     @@nested_genres << genre
#   end
#   @@nested_genres # class variable
#   binding.pry
# end



def self.all_genres
  @@nested_genres
end

def self.find_genre(input)
  @@nested_genres[input-1]
end


  # def self.scrape_book(all_genres)  #line 26 .. get the genre_book.url... that where you get your info..
    # doc = Nokogiri::HTML(open(all_genres))
    # # chances are i need to change to Url for the website... so i can use it..
    # #  we need to add the orginal url + semi scraped book_url
    # doc.search("article.product_page").map do |box|
    #   # binding.pry
    #    name = box.css("h1").text #done
    #    price = box.css("p.price_color").text
    #    url = box.css("h3 a")
    #   #  binding.pry
    #   #TODO scrape url -> doc_2 = Nokogiri::HTML(open(url))
    #   # need to get the description and product_information
    #   book_description = box.css("p").text
    #   product_information = box.css("tbody tr td").text
    #   @@pages << {name: name, book_description: book_description, product_information: product_information, price: price}
    # end
    #   @@pages  #it works when when called in the   "def self.scrape_genre"
    # end


    # def self.all_pages
    #   @@pages
    # end
  
end
