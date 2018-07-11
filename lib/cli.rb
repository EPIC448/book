
# require 'colorize'
# Warning... IT work.. IT takes long to load

class CLI
   
     def call   
      Genre_Scraper.scrape_genres

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
            puts ""

            input = gets.strip.downcase

            if input == "genre"
              genre_list
            elsif input == "books"
              list_book_genre
            elsif input == "exit"
              goodbye
              puts ""
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
        puts "Type Desired genre (i.e art) or more to see the next 10 books.. or menu to go back to Previous menu."
        puts ""
        input = nil
        while input != "exit"
        
        input = gets.strip.downcase
        
         

        if  Genre.find_by_name (input) #in genre_scraper  
          @genre =  Genre.find_by_name (input)
          if @genre.books.length == 0 
            Book_Scraper.scrape_books(@genre)
          end

          @sorted_books = @genre.books.sort_by{|genre|genre.book_name}
        
                    @sorted_books[0..9].each.with_index(1) do |x, index|  # shows  10 books
                    puts""
                    puts "#{index}. #{x.book_name} - #{x.genre.name} - #{x.book_info}"
                    puts ""
                    end

                    list_book_genre
                    
         

        elsif input == "more"
          
          num_of_books = @sorted_books.length

                 if num_of_books >= 11 && num_of_books <= 20   # check total books

                    @sorted_books[10..19].each.with_index(11) do |x, index|  # checking the index...
                      puts""
                    puts "#{index}. #{x.book_name} - #{x.genre.name} - #{x.book_info}"
                    puts "" 
                      
                    end
                    list_book_genre

                else 
                    puts ">>>>>>>>SORRY! NO MORE BOOKS<<<<<< >>>>> type Menu to see Previous menu<<<<<<<," 
                end

        elsif input == "menu"
          call


        elsif input == "exit"
           goodbye
          exit
           
        else
          puts "I don't understand what you typed"
          list_book_genre
        end
        end
      end
    


    def goodbye
      puts ""
      puts 'SEE YOU TO TOMOOROW or C U 2 morrow :)'
      puts ""

       exit
    end


  end   