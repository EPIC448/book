
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

            # input = gets._i.strip
        
            
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
       #TODO: create a method that takes the input as an arguement and sracpes the books from that genre - this can live in the solo book class
          
       #TODO: create a method that lists the first 10 books
       #TODO: user options go here
       #TODO: get user input for options #done
        # option
        goodbye
     end
  
     def genre
         List_genre.all.each_with_index do |genres, index|
           puts "#{index + 1}. #{genres.name}"
           #checked and good to go
       end
     end


     def book_list
        List.all
        
      end

      def book_detail
        Details.check

        # Book_scraper.all_pages.each do |book|
        #   binding.pry
        #   puts "#{i}.#{list.name} - #{book.book_description} - #{book.url}"
      end


    def goodbye
      puts 'see you tomorrow'
    end

  end


    # ^^^ every thing works up to here ^^^^

    