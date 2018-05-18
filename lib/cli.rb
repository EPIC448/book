
# require 'colorize'

class CLI
   
     def call   
      Genre.scrape_genres

      BookModel.scrape_books

      input = nil
        while input != "exit"
            puts ""
            puts ""
            puts "Welcome to the Book Scraper!" 
            puts ""
            puts ""
            puts "Type Genre to see list of genre"
            puts ""
            puts ""
            puts "Type Genre to see the list of genres again"
            puts ""
            puts ""
            puts "Type Books to see the list of books in a genre"
            puts ""
            puts ""
            puts "Type Exit to exit the program"

            input = gets.strip.downcase

            if input == "genre"
              genre_list
            elsif input == "books"
              list_book_genre
            else
              "not sure what you type. Please type Exit or Type of the suggestion"
            end
        end

        # goodbye
      end
     
  
     def genre_list
            Genre.all.uniq.each_with_index do |genre, index|
            puts "#{index + 1}. #{genre.name}"  #shows only genre
            
            end
                  
      end

    

      def list_book_genre
        puts ""
        puts ""
        puts "Type Desired genre (i.e art) or more to see the next 10 books..."
        puts ""
        puts ""
        input = nil
          while input != "exit"
    
        input = gets.strip.downcase
        genre  = Genre.find_by_name (input)     
        genre

          if genre
          
            sorted_books = genre.books.sort_by{|genre|genre.book_name}
            sorted_books[0..9].each.with_index do |x, index|  # shows  10 books
            puts "#{index + 1}. #{x.book_name} - #{x.genre.name}"
              end

            puts ""
            puts ""

           elsif input == "more"

               sorted_books[10..20].each.with_index do |x, index|  # shows  20 books
              puts "#{index + 10}. #{x.book_name} - #{x.genre.name}"
               end

           else
              puts "Not sure what you type. Please type More (to see the next 10 books) or Exit(to back space to Genre) "
           
          
            end     
          end #end the While input sentance
        end


    def goodbye
      puts 'see you tomorrow'
    end

  end    