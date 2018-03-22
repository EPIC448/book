class Book::Book_scraper

  attr_accessor :genre, :name, :book_description, :product_information, :price, :url
  #shift Q to get back in pry

  # a method that iterater over book methods.

  def self.collection
    # keep Return the instances. We need to change that.
    collection = [ ]
    collection << self.scrape_genre
    collection << self.scrape_book
    collection
  end

  # we need to have it in single... order per book.

  def self.scrape_genre
    doc = Nokogiri::HTML(open("http://books.toscrape.com"))
    list = []
    doc.search("ul.nav.nav-list ul a").map do |container|
      container.each do |list|
        list = self.new
        list.genre = container.text
        list
      end
    end
  end

  # look at your student scraper method...

  def self.scrape_book #(books in a genre)
    doc = Nokogiri::HTML(open("http://books.toscrape.com/catalogue/category/books_1/index.html"))
    # doc.search("div.col-sm-8.col-md-9").map do |box|
    doc.search("article.product_pod").map do |box|

      list = self.new
      list.book_description = box.search("p").text
      list.product_information = box.search("p.instock.availability").text
      list.price = box.search("p.price_color").text
      list
    end
  end
end
