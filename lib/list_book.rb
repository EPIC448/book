
class BookModel

    #dont for get to add "self" to your methods.
    @@all_book = []
    attr_accessor :book_name, :price, :book_info
    attr_reader :genre

    def initialize(book_name: nil, price: nil, book_info: nil)
        @book_name = book_name
        @price = price
        @book_info  = book_info
        @genre = []
    end
    
    def self.scrape_books
        genre = Genre.all
        genre.each do |each_genre|
        content = each_genre.url
        content  
      # music labray will help with this.
        #each content is already iterated over.
       #need an if else statment.. here...
      
       doc = Nokogiri::HTML(open(content))   #note content URL link
       data = doc.search ("h3 a") 
       object_book = BookModel.new
        object_book.book_name = data.map {|one_book| one_book.text } #keep
        object_book.price = doc.search("div.product_price > p.price_color").map{|price| price.text}  #keep
        @@all_book << object_book
          end
          @@all_book

      end
    
  def self.all
    @@all ||= scrape_books # no duplicates
    # 
  end
# >>>>>>>>>>>>>>>>
  # We need to buid a relationship in with Genre knows it had many books
  #we can say 
  #genre.bookmodel.
  # <<<<<<<<<<<

def genre=(genre)
   @genre = genre
   genre.add_book(self)
end

  def add_genre(genre)
    @genre << genre unless @genre.include?(genre)
    genre.bookmodel = self unless genre.bookmodel == self
binding.pry
  end


    # def self.find_by_name(name)
      #      self.all.find {|x| x.name == name}
      #  end


  
end
