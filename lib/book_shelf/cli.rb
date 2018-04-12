require_relative "book_scraper.rb"
require_relative "solo_book.rb"
require 'nokogiri' 
require 'pry'

# require 'colorize'

class CLI
  BASE_PATH = true # we most add value to this places... 
   
     def call
      puts "Welcome to the Book Scraper!"
       list_books
       genre_list 
       puts "Please select the number of genre:"
       input = gets.strip.to_i
         user_genre = Book_scraper.find_genre(input)
         Book_scraper.scrape_genre_books(user_genre)
       #TODO: create a method that takes the input as an arguement and sracpes the books from that genre - this can live in the solo book class
       #TODO: create a method that lists the first 10 books
       #TODO: user options go here
       #TODO: get user input for options
        single_book
        # option
     end
  
     def list_books
      book_array = Book_scraper.scrape_genre  # calls the class method in book_scraper.rb
      # # # Book.indicate_genre(book_array)   # create a method in genre.rb that breaks this down.  
      end

      def genre_list
        #TODO: list out the genres
        Book_scraper.all_genres.each.with_index(1) do |genre, index| 
          puts "#{index} - #{genre.name}"
          SoloBook.create_genre_books(genre.url)
         
        end
      end


      # stopping point
      def single_book
       SoloBook.all.each do |genre_book|
       
         target_url = genre_book.book_url.map{|book_url| book_url}.join#returned an hash of which we iterate over and got the index.
        #issue it iterating.. But one of the url dont fit...
        attributes = Book_scraper.scrape_book( "http://books.toscrape.com/" + target_url )
        binding.pry

       genre_book.scrape_book(attributes_in_hash)
      
      end
    end


    # ^^^ every thing works up to here ^^^^

    # google "how to output 10 items at a time from array ruby"

  #  def option
    # input = nill
    # while input != "exit"
    #   puts "Type Geners to view book geners"
    #   puts "OR"
    #   puts"Type more books to view the next 10 books"
    #   puts "OR"
    #   puts " exit to Discountinue"
    #   input = gets.strip.downcase

    #   i = input.to_i-1

    #   if input.to_i > 0
    #       list = @list[i] #line 22
    #       puts "#{i}. #{list.genre} - #{list.name} - #{list.book_description} - #{list.url}"
    #     elsif input == "Genres"
    #       puts "list.genre"
    #     elsif input == "more books"
    #       puts "list the next 10 books"
    #     elsif input ==  "exit"
    #       goodbye
    #     else
    #     puts "not sure what you want"
    #   end
    #   end
    # end

    # def goodbye
    #   puts "see you tomorrow"
    # end
  #  end

end

