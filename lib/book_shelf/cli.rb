require_relative "book_scraper.rb"
require_relative "solo_book.rb"
require 'nokogiri' 
require 'pry'

# require 'colorize'

class CLI
  BASE_PATH = true # we most add value to this places... 
   
     def call
       list_books
        single_book
        # option
     end
  
     def list_books
      book_array = Book_scraper.scrape_genre  # calls the class method in book_scraper.rb
      # # # Book.indicate_genre(book_array)   # create a method in genre.rb that breaks this down.
      SoloBook.create_genre_collection(book_array)    
      end


      # stopping point
      def single_book
       SoloBook.all.each do |genre_book|
        
        target_url = genre_book.book_url.each{|book_url| book_url}.join #returned an hash of which we iterate over and got the index.
       #issue it iterating.. But one of the url dont fit...
        binding.pry
        attributes = Book_scraper.scrape_book( target_url)

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

