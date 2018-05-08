
# require 'colorize'

class Book::CLI
   
     def call
      puts "Welcome to the Book Scraper!"
       list_genres
       genre_list
       goodbye
       
       puts "Please select the number  genre:"
        puts "like to see 10 more books"
        puts "like to see the list of genres again"
        puts "like to exit the program"

       input = gets.strip.to_i
         user_genre = Book_scraper.find_genre(input)
           puts "#{user_genre.name}"  # this works well.
         puts "#{book_info}"

       #TODO: create a method that takes the input as an arguement and sracpes the books from that genre - this can live in the solo book class
          
       #TODO: create a method that lists the first 10 books
       #TODO: user options go here
       #TODO: get user input for options #done
        # option
     end
  
     def list_genres
      book_array = Book::Book_scraper.scrape_genre  # calls the class method in book_scraper.rb
      
    end

      def genre_list
        #TODO: list out the genres
        Book_scraper.all_genres.each.with_index(1) do |genre, index| 
          puts "#{index} - #{genre.name}"
        end
      end

      def list_book
        Book_scraper.all_pages.each do |book|
          binding.pry

          puts "#{i}.#{list.name} - #{book.book_description} - #{book.url}"
        end
      end

      # stopping point
    #   def book_info
    #     Book_scraper.all_pages.each do |book_details|

    #      target_url = genre_book.book_url.map{|book_url| book_url}.join#returned an hash of which we iterate over and got the index.
    #     #issue it iterating.. But one of the url dont fit...
    #     attributes = Book_scraper.scrape_book( "http://books.toscrape.com/" + target_url )

    #    genre_book.scrape_book(attributes_in_hash)
      
    #   end
    # end

    def goodbye
      puts 'see you tomorrow'
    end

  end


    # ^^^ every thing works up to here ^^^^

    