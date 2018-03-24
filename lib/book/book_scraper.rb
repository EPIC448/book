class Book::Book_scraper

  attr_accessor :genre, :name, :book_description, :product_information, :price, :book_url
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
    genre = container.text.strip     #works perfect
    url = container.values           #works perfect
    list<< {genre: genre, book_url: url}
    url = url[0]
    self.scrape_book(url)
    end
    list
  end

  # look at your student scraper method...
  #list right now is a string.
  def self.scrape_book(book_url)
    doc = Nokogiri::HTML(open("http://books.toscrape.com/" + book_url))
    #  we need to add the orginal url + semi scraped book_url
    pages = [ ]
    binding.pry
      doc.search("li.col-xs-6.col-sm-4.col-md-3.col-lg-3").map do |box|
      pages = self.new
      pages.book_description = box.css("h3 a").children.text
      pages.product_information = box.css("p.instock.availability").text
      pages.price = box.css("p.price_color").text
      pages
    end
  end
end
