class Book_Scraper

    def self.scrape_books

        Genre.all.each do |genre|
            content = genre.url
              
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
                
                new_book = BookModel.new(book_name, book_info)
                new_book.save
                genre.add_book(new_book) #chain the ... add book method from genre_scraper

         end

       end
      
    end

end