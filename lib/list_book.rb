
class BookModel

    #dont for get to add "self" to your methods.
    @@all = []

    attr_accessor :book_name,:book_info
    attr_reader :genre

    # Warning... IT work.. IT takes long to load

    def initialize(book_name = nil, book_info= nil) #connect your self.scrape_genre... initailize

      @book_name = book_name
      @book_info = book_info
      
      self.save
      
     end
    # connect your self.scrape_books... initailize

    def self.scrape_books

        Genre.all.each do |genre|
            content = genre.url
              
          # music labray will help with this.
            #each content is already iterated over.

          doc = Nokogiri::HTML(open(content))   #note content URL link
          books = doc.search ("h3 a")
          
          # books_genre = doc.search("h1").text  #itereate through data.... 
          books.map do |book| #get all books

                url = Nokogiri::HTML(open("http://books.toscrape.com/catalogue/#{book.values.first.gsub('../','')}"))

                book_name = book.text
                book_info = url.css("#content_inner > article > p").text #keep
 
                        
                #you can manully add the site url that you need (i.e "http://books.toscrape.com/catalogue/").
                # used Gsub to remove ('../', '') in  ../../../its-only-the-himalayas_981/index.html" 
                
                new_book = BookModel.create(book_name, book_info)
                genre.add_book(new_book) #chain the ... add book method from genre_scraper

         end

       end
      
    end


      def save
        @@all << self
      end

      
    def self.all
      @@all ||= scrape_books # no duplicates
    end

  # >>>>>>>>>>>>>>>>
    # We need to buid a relationship in with Genre knows it had many books
    # <<<<<<<<<<<

  # def self.create(name)   #Instantiation
  #   bookmodel = BookModel.new(name)
  #   bookmodel.save
  #   bookmodel
  # end

 # creation of add_book(book) in genre_scraper

  def genre=(genre)  #list of books has one genre
    @genre = genre
    genre.add_book(self)
  end


    def self.find_by_name(name)
           self.all.find {|x| x.name == name}
    end
  
end
