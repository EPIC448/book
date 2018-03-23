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
        list.genre = container.text
        list.url = #{a.attr('href')} ????
        list
        url
    end
  end

  # look at your student scraper method...

  def self.scrape_book(url)
    doc = Nokogiri::HTML(open(url))
    list = [ ]
      doc.search("li.col-xs-6.col-sm-4.col-md-3.col-lg-3").map do |box|
      list = self.new
      binding.pry
      list.book_description = box.css("h3 a").children.text
      list.product_information = box.css("p.instock.availability").text
      list.price = box.css("p.price_color").text
      list
    end
  end
end
