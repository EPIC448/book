class Book::Book_scraper

  attr_accessor :genre, :name, :book_description, :url

    def self.scraper

      doc = Nokogiri::HTML(open("http://books.toscrape.com/"))
       doc.search("div.page_inner").map do |container|
        #  binding.pry

      read = self.new
      # read.genre = doc.search("li a").text
      # read.name = doc.search("h3 a").text
      # read.book_description = doc.search(".").text
      # read.url = doc.search(".").text
      # # price = doc.search("p.price_color").text
      #read
     end
    end
    #shift Q to get back in pry

end
