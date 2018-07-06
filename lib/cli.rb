
# require 'colorize'
# Warning... IT work.. IT takes long to load

class CLI
   
     def call   
      Genre_Scraper.scrape_genres
      # Book_Scraper.scrape_books

      input = nil
        while input != "exit"
            puts ""
            puts "Welcome to the Book Scraper!" 
            puts ""
            puts "Type Genre to see the list of genres"
            puts ""
            puts "Type Books to be prompted for books in a genre"
            puts ""
            puts "Type exit to exit the program"

            input = gets.strip.downcase

            if input == "genre"
              genre_list
            elsif input == "books"
              list_book_genre
            else
              "not sure what you type. Please type exit or Type of the suggestion"
            end
        end

      end
     
# Warning... IT work.. IT takes long to load

  
     def genre_list
            Genre.all.each_with_index do |genre, index|
            puts "#{index + 1}. #{genre.name}"  #shows only genre           
            end
                  
      end

    

      def list_book_genre
        puts ""
        puts "Type Desired genre (i.e art) or more to see the next 10 books.. or exit to go back to Previous menu."
        puts ""
        input = nil
        while input != "exit"
    
        input = gets.strip.downcase
        
        if  Genre.find_by_name (input) #in genre_scraper  
          genre =  Genre.find_by_name (input)
          if genre.books.length == 0 
            Book_Scraper.scrape_books(genre)
          end

          sorted_books = genre.books.sort_by{|genre|genre.book_name}
                    sorted_books[0..9].each.with_index(1) do |x, index|  # shows  10 books
                    puts""
                    puts "#{index}. #{x.book_name} - #{x.genre.name} - #{x.book_info}"
                    puts ""
                    end

                    list_book_genre
         

        elsif input == "more"
          binding.pry
          num_of_books = sorted_books.length

                 if num_of_books >= 11 && num_of_books < 20

                    sorted_books[10..19].each.with_index(11) do |x, index|  # shows  20 books
                      puts""
                    puts "#{index}. #{x.book_name} - #{x.genre.name} - #{x.book_info}"
                    puts "" 
                    end
                    list_book_genre

                  else 
                        puts ">>>>>>>>SORRY! NO MORE BOOKS<<<<<<"
                        list_book_genre
                  end

        elsif input == "exit"
           break
           
        else
          puts "I don't understand what you typed"
          list_book_genre
        end
        end
      end
    


    def goodbye
      puts 'see you tomorrow'
    end


  end   