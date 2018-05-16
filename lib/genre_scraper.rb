class Genre

    attr_accessor  :name, :url, :books
   @@all = []
   @@all_genre = []

 # focus of th song to genre relationship
 #genre has many books

 def self.scrape_genres
        doc = Nokogiri::HTML(open("http://books.toscrape.com"))

        doc.search("ul.nav.nav-list ul a").map do |container|
          genre = Genre.new
          genre.name = container.text.strip     #works perfect
          genre.url = "http://books.toscrape.com/#{container.values.join}" 
          # doc.search("div.page_inner").children
          #works perfect
          genre.books = [ ]
          genre.save
          genre
        end
    end
    # configure it no to duplicate

    def save
     @@all_genre <<  self
  
    end

      def self.all
      @@all_genre
         end

      

   # bring in the book
      
#       def self.create(book)
#         book = BookModel.new(name)
#         book.save
#         book
#  binding.pry
#       end
      

      def add_book(book)
        @books << book unless @books.include?(book)
        book.genre = self if book.genre != self

      end

      def genres

        @books.collect{|book| book.song}.uniq

      end

            #relationship that genre has many book

  
            def self.find_by_name (name)
                self.all.find {|x| x.name.downcase == name.downcase}
            end

end