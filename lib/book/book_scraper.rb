class Book::Book_scraper

  attr_accessor :genre, :name, :book_description, :product_information, :price, :url
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
        list = self.new
        list.genre = doc.search("li a").text
        list.name = doc.search("h3 a").text
        list.url = "http://books.toscrape.com/"
        list.price = doc.search("p.price_color").text
        list
     end
    end

# look at your student scraper method...
    def self.scraper_single_page
      doc = Nokogiri::HTML(open("url"))
      doc.search("article.product_page").map do |container|
        list = self.new
        list.book_description = doc.search("p").text
        list.product_information = doc.search("tr").text
        list
     end
    end


end
