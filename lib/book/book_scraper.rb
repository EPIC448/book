class Book::Book_scraper

  attr_accessor :genre, :name, :book_description, :url

    def self.scraper
      binding.pry
      doc = Nokogiri::HTML(open("http://books.toscrape.com"))
       doc.css(".article.product_pod").map do |all_element|
      read = self.new
      read.genre
      read.name
      read.book_description
      read.url
      read
     end
    end

end
