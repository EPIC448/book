class Genre_Scraper



   def self.scrape_genres
    doc = Nokogiri::HTML(open("http://books.toscrape.com"))
    #doc is local variable.. local scoop
    doc.search("ul.nav.nav-list ul a").map do |container| # array of hashes
      
      name = container.text.strip     #works perfect
      url = "http://books.toscrape.com/#{container.values.join}" 
      #works perfect
      books = [ ]
      genre = Genre.new(name,url,books)
      genre.save
      genre
      
    end
   end
# Warning... IT work.. IT takes long to load

end