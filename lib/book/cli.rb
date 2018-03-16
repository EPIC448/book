
class Book::Cli


  def list_books
    @book_scraper = Book::Book_scraper.scraper
    @book_scraper.each.with_index(1) do | list,i|
      puts "#{i}. #{list.genre} - #{list.name} - #{list.book_description} - #{list.url}"
    end
  end

  def option
    input = nill


    while input != "exit"

       puts "Type Geners to view book geners"
       puts "OR"
        puts"Type more books to view the next 10 books"
          puts "OR"
             puts " Exit to Discountinue."
                

      input = gets.strip.downcase
      i = input.to_i-1

      if input.to_i > 0
        list = @list[i] #line 19
        puts "#{i}. #{list.genre} - #{list.name} - #{list.book_description} - #{list.url}"
      elsif input = "Genres"
        puts "list.genre"
      elsif input ="more books"
        puts "list the next 10 books"
      elsif input = "exit"
        goodbye
      else
        puts "not sure what you want"



        "A user should be presented with a list of Book Genres to select from.
        Once a user selects a genre, they should then be presented with a list of book names from that genre.
        The user should only see the first ten books, there should be an option for the user to either select from that list or see the next set of ten books.
        A user can then select a book and be given the books name, the Product description, and its product information.
        The user should be able to then see the book list again, start over or exit the gem."
      end
    end

    def goodbye
      puts "see you tomorrow"

    end
  end
