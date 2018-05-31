class Genre

    attr_accessor  :name, :url, :books
    @@all_genre = []

 # focus of th song to genre relationship
 #genre has many books

 def self.scrape_genres
        doc = Nokogiri::HTML(open("http://books.toscrape.com"))
#doc is local variable.. local scoop
        doc.search("ul.nav.nav-list ul a").map do |container| # array of hashes
          genre = Genre.new
          genre.name = container.text.strip     #works perfect
          genre.url = "http://books.toscrape.com/#{container.values.join}" 
          #works perfect
          genre.books = [ ]
          genre.save     # configure it no to duplicate

          genre
        end
    end
# Warning... IT work.. IT takes long to load


    def save
     @@all_genre <<  self
  
    end

    def self.all
      @@all_genre
    end

#  we connect book to genre/this not a class method. Built after the BookModel is created
    
    def add_book(book)
      @books << book unless @books.include?(book)
      book.genre = self if book.genre != self
    end

     #relationship that genre has many book


    def self.find_by_name (name)
        self.all.find {|x| x.name.downcase == name.downcase}
    end

end