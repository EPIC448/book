
class BookModel

    #dont for get to add "self" to your methods.
    @@all = []

    attr_accessor :book_name,:book_info, :genre

    # Warning... IT work.. IT takes long to load

    def initialize(book_name = nil, book_info= nil) #connect your self.scrape_genre... initailize

      @book_name = book_name  
      @book_info = book_info
      
      self.save
      
     end
    # connect your self.scrape_books... initailize

   

      def save
        @@all << self
      end

      
    def self.all
      @@all ||= scrape_books # no duplicates
    end

  # >>>>>>>>>>>>>>>>
    # We need to buid a relationship in with Genre knows it had many books
    # <<<<<<<<<<<

 # creation of add_book(book) in genre_scraper

#  >>>>> 
    # turn this to attr_accessors
# def genre=(genre)  #list of books has one genre
#   #   @genre = genre
#   #   # genre.add_book(self)
#   # end   
#   <<<<<<<<


    def self.find_by_name(name)
           self.all.find {|x| x.name == name}
    end
  
end
