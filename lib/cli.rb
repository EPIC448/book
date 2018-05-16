
# require 'colorize'

class CLI
   
     def call   
      Genre.scrape_genres

      BookModel.scrape_books

      input = nil
        while input != "exit"

            puts "Welcome to the Book Scraper!" 
            puts "Type Genre to see list of genre"
            puts "Please select the number  genre:"
            puts "Type books to see 10 more books"
            puts "Type Genre to see the list of genres again"
            puts "Type exit to  exit the program"

            input = gets.strip.downcase

            if input == "genre"
              genre_list
            elsif input == "list book genre"
              list_book_genre

            else
              "not sure what you type. Please type Exit or one of the suggestion"
            
            end

        end

        # goodbye
      end
     
  
     def genre_list
            Genre.all.uniq.each_with_index do |genre, index|
            puts "#{index + 1}. #{genre.name}"  #shows only genre
            
            end
                  
      end

    #  def list_book
    #   sorted_books = BookModel.all.sort_by {|x| x.name }
    # end

    #  def list_book_genre

    #   index = input.to_i-1
    #    if input == (input)   # #genre number selected
    #   end

      def list_book_genre
        input = nil
          while input != "exit"
    
        puts "Type the genre to see the books in that genre..."
        input = gets.strip.downcase
        genre  = Genre.find_by_name (input)     
         genre

          if genre

            sorted_books = genre.books.sort_by{|genre|genre.book_name}
            sorted_books.each_with_index do |x, index|
            puts "#{index + 1}. #{x.book_name} - #{x.genre.name} - #{x.price} "
           #listing all books
            end
          end
        end #end the While input sentance
          
        end


    def goodbye
      puts 'see you tomorrow'
    end

  end    