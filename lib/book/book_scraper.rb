class Book::Book_scraper

  attr_accessor :genre, :name, :book_description, :url

    def self.scraper
      doc = Nokogiri::HTML(open("http://books.toscrape.com/"))
       doc.search(".product_pod").map do |container|
      read = self.new
      binding.pry
      # read.genre = doc.search(".")
      # read.name = doc.search(".").text.strip
      # read.book_description = doc.search(".").text
      # read.url = doc.search(".").text
      # # price = p.price_color
      read
     end
    end

end
