class Genre
    attr_accessor  :name, :url
    attr_reader :books

    @@all_genre = []

 def initialize(name: nil, url: nil)
     @name = name
     @url = url
     @books = []
 end


 def self.scrape_genres
        doc = Nokogiri::HTML(open("http://books.toscrape.com"))

        doc.search("ul.nav.nav-list ul a").map do |container|
          genre = Genre.new
          genre.name = container.text.strip     #works perfect
          genre.url = "http://books.toscrape.com/#{container.values.join}" 
          # doc.search("div.page_inner").children
          #works perfect
          @@all_genre << genre
        end
        @@all_genre # class variable
    end


      def self.all
       @@all ||= scrape_genres  # if self.all is @aall or equal to. (no duplicates)

      end

      #relationship that genre has many book
      def add_book(book)
        @books << book unless @books.include?(book)

      end



end