
# require 'colorize'

class CLI
   
     def call   
      input = nil
        while input != "exit"

            puts "Welcome to the Book Scraper!" 
       

            puts "Please select the number  genre:"
            puts "Type books to see 10 more books"
            puts "Type Genre to see the list of genres again"
            puts "Type exit to  exit the program"

            input = gets.strip.downcase
            index = input.to_i

            if input == "genre"
              genre

            elsif input == "list book genre"
              list_book_genre

            else
              "not sure what you type. Please type Exit or one of the suggestion"
            
            end

          end

        # goodbye
     end
  
     def genre
         Genre.all.each_with_index do |genres, index|
           puts "#{index + 1}. #{genres.name}"

           #checked and good to go
                 # need to list book of a selected genre.  
                    #  Note: if genre is selected, then ---- list .... books
                  end
                  
     end

     def list_book
      sorted_books = BookModel.all.sort_by {|x| x.name }
    end

  

    #  def list_book_genre

    #   input = nil
    #   while input != "exit"

    #  
    #  
    #   index = input.to_i-1

    #    if input == (input)   # #genre number selected
        
    #   end

      def list_book_genre
        puts "Type the genre to see the books in that genre..."
        input = gets.strip.downcase
        genre  = Genre.find_by_name (input)     
         genre

          if genre
            sorted_books = genre.books.sort_by{|book|book.name}
            sorted_books.each_with_index do |book, index|
           puts "#{index + 1}. #{book.name} - #{book.genre.name} "
           #listing all books
            end
        end
      end





    def goodbye
      puts 'see you tomorrow'
    end

  end    