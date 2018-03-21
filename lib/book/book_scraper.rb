class Book::Book_scraper

  attr_accessor :genre, :name, :book_description, :product_information, :price, :url
  #shift Q to get back in pry

  # a method that iterater over book methods.

   def self.collection
     # keep Return the instances. We need to change that.
      collection = [ ]
      collection << self.scraper_homepage
      collection << self.scraper_single_page
      collection
   end

# we need to have it in single... order per book.

    def self.scraper_homepage
      doc = Nokogiri::HTML(open("http://books.toscrape.com"))
      list = []
      doc.search("div.page_inner").map do |container|

        container.each do |list|
          binding.pry
        list = self.new
        list.genre = container.search("li a").text
        list.name = container.search("h3 a").text
        list.url = "http://books.toscrape.com/"
        list.price = container.search("p.price_color").text

        list
      end
     end
    end

# look at your student scraper method...

    def self.scraper_single_page
      doc = Nokogiri::HTML(open("http://books.toscrape.com"))
      doc.search("article.product_page").map do |container|
        list = self.new
        list.book_description = container.search("p").text
        list.product_information = container.search("tr").text
        list
     end
    end


end
