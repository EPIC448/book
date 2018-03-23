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
    list = self.new
    genre = container.text.strip     #works perfect
    url = container.values           #works perfect
    list << {genre: genre, url: url}
    #:genre=>"Travel", :url=>["catalogue/category/books/travel_2/index.html"]
    end
    #how do we just call genre.
    #note genre and Url is a string.
    list
  end

  # look at your student scraper method...
  #list right now is a string.
  def self.scrape_book(list)
    binding.pry
    doc = Nokogiri::HTML(open(list))
    pages = [ ]

      doc.search("li.col-xs-6.col-sm-4.col-md-3.col-lg-3").map do |box|
      pages = self.new
      pages.book_description = box.css("h3 a").children.text
      pages.product_information = box.css("p.instock.availability").text
      pages.price = box.css("p.price_color").text
      pages
    end
  end
end
