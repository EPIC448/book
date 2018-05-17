
class BookModel

    #dont for get to add "self" to your methods.
    @@all_book = []
    @@all = []

    attr_accessor :book_name, :price, :book_info
    attr_reader :genre

    
    def self.scrape_books
        genres = Genre.all
        genres.each do |each_genre|
        content = each_genre.url
        content  
      # music labray will help with this.
        #each content is already iterated over.
       #need an if else statment.. here...
      
       doc = Nokogiri::HTML(open(content))   #note content URL link
       data = doc.search ("h3 a")
       data_genre = doc.search("h1").text  #itereate through data.... 
       data.map do |book| #get all books
       object_book = BookModel.new
       object_book.genre = Genre.find_by_name(data_genre) # in Genre class
       object_book.genre.add_book(object_book)
       object_book.book_name = book.text #keep

       object_book.price = doc.search("p.price_color").text #keep look at how to progress throught numbers
  
      #  price.each do |x|
      #   puts "x"
       binding.pry

        #  = puts price.next

      #  object_book.price = doc.search("p.price_color").each{|x + 1| puts x.text}

       object_book.save
       end
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
    #we can say 
    #genre.bookmodel.
    # <<<<<<<<<<<

  def self.create(name)
    bookmodel = BookModel.new(name)
    bookmodel.save
    bookmodel
  end


  def genre=(genre)  #list of books has one genre
    @genre = genre
    genre.add_book(self)
  end

#   def self.add_genre(genre)
#     @genres << genre unless @genres.include?(genre)
#     genre.bookmodel = self unless genre.bookmodel == self
# binding.pry
#   end

    def self.find_by_name(name)
           self.all.find {|x| x.name == name}
    end
  
end
