
# require 'colorize'
# Warning... IT work.. IT takes long to load

class CLI
   
     def call   
      Genre.scrape_genres

      BookModel.scrape_books

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
              "not sure what you type. Please type Exit or Type of the suggestion"
            end
        end

      end
     
# Warning... IT work.. IT takes long to load

  
     def genre_list
            Genre.all.uniq.each_with_index do |genre, index|
            puts "#{index + 1}. #{genre.name}"  #shows only genre           
            end
                  
      end

    

      def list_book_genre
        puts ""
        puts "Type Desired genre (i.e art) or more to see the next 10 books.. or Exit to go back to Previous menu."
        puts ""
        input = nil
          while input != "exit"
    
        input = gets.strip.downcase
        genre  = Genre.find_by_name (input) #in genre_scraper     
        genre

            if genre

                    sorted_books = genre.books.sort_by{|genre|genre.book_name}
                    sorted_books[0..11].each.with_index do |x, index|  # shows  10 books
                      puts""
                    puts "#{index + 1}. #{x.book_name} - #{x.genre.name} - #{x.book_info}"
                    puts ""
                    end
                  
                puts "Type More to view More books"

            elsif input == "more"
             num_of_books = sorted_books.length

                 if num_of_books >= 11 && num_of_books < 20

                    sorted_books[12..21].each.with_index do |x, index|  # shows  20 books
                      puts""
                    puts "#{index + 12}. #{x.book_name} - #{x.genre.name} - #{x.book_info}"
                    end #end of do statment for this block
                    
                  puts " Type 10_more to see the next ten"

                elsif input == "10_more" && num_of_books.between?(20, 33) 

                        sorted_books[13..32].each.with_index do |x, index|  # shows  20 books
                          puts""

                        puts "#{index + 13}. #{x.book_name} - #{x.genre.name} - #{x.book_info}"
                        end
                  else 
                     puts ">>>>>>>>SORRY! NO MORE BOOKS<<<<<< Type Back to go back to previous meun "                                       
                  end #ends if statment for num_of_books

            elsif input == "back"
              list_book_genre

            else
              puts "Not sure what you type, Type exit to go back to main menu"
              puts ""

              end #end of if statement
                      
           end #end the While input sentance

        end


    def goodbye
      puts 'see you tomorrow'
    end


  end   