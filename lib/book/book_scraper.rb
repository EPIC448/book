class Book::Book_scraper

  attr_accessor :genre, :name, :book_description, :product_information, :url
  #shift Q to get back in pry

  # a method that iterater over book methods.

   def self.collection
      collection = [ ]
      collection << self.scraper_homepage
      collection << self.scraper_single_page
      collection
   end


    def self.scraper_homepage
      doc = Nokogiri::HTML(open("http://books.toscrape.com/"))
      doc.search("div.page_inner").map do |container|
      read = self.new
      read.genre = doc.search("li a").text
      read.name = doc.search("h3 a").text
      read.url = "http://books.toscrape.com/"
      read.price = doc.search("p.price_color").text
      binding.pry
      read
     end
    end

    def self.scraper_single_page
      doc = Nokogiri::HTML(open("http://books.toscrape.com/catalogue/a-light-in-the-attic_1000/index.html"))
       doc.search("article.product_page").map do |container|
      read = self.new
    read.book_description = doc.search("p").text
   read.product_information = doc.search ("tr").text
      #read
     end
    end


end
