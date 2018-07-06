class Genre

    attr_accessor  :name, :url, :books
    @@all_genre = []   #class variable

 # focus of th song to genre relationship
 #genre has many books
#  @ sign make what comes after it and instance varible.

   def initialize(name = nil, url = nil, books = nil)   #connect your self.scrape_genre... initailize

        @name = name
        @url = url
        @books = books
        self.save  
   end

 


    def save
     @@all_genre <<  self
  
    end

    def self.all
      @@all_genre
    end

#  we connect book to genre/this not a class method. Built after the BookModel is created
    
    def add_book(book)  #line 60-71 list_book
      @books << book unless @books.include?(book)
      book.genre = self if book.genre != self
    end

     #relationship that genre has many book


    def self.find_by_name (name)
        self.all.find {|x| x.name.downcase == name.downcase}

    end

end