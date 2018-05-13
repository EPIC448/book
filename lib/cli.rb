
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

           
            # index = input.to_i-1
            index = input.to_i

            if input == "genre"
              genre

            elsif input == "list"
                book_list

            elsif input == "detail"
            book_detail

            # elsif input == "exit"
            #    goodbye
            else
              "not sure what you type. Please type Exit or one of the suggestion"
            
            end
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

  

     def book_list

      input = nil
      while input != "exit"

      puts "Type the genre to see the books in that genre..."
    
      input = gets.strip.downcase

      # if input == (input)   # #genre number selected
      #   genres.BookModel (# it will show books in the genre)
              
          # BookModel.all.each_with_index do |bundle, index|

        #list the books in that genre


          # BookModel.find(input)

          # puts "#{index + 1}. #{bundle}"
           #listing all books
      #  end
      end


    def goodbye
      puts 'see you tomorrow'
    end

  end    