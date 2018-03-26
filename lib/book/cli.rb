
class Book::CLI


  def self.list_books
     @roll = Book::Book_scraper.collection
    #roll could be anything
    #@roll = Book::Book_scraper.scrape_genre
     @roll.each_slice(10) {|a| a}
     @roll.each.with_index(1) do |roll,i|
      puts "#{i}. #{roll.genre} - #{roll.name} - #{roll.product_information} -  #{roll.price} - #{roll.book_description}"
    end
  end

# google "how to output 10 items at a time from array ruby"

  def option
    input = nill
    while input != "exit"
      puts "Type Geners to view book geners"
      puts "OR"
      puts"Type more books to view the next 10 books"
      puts "OR"
      puts " exit to Discountinue"
      input = gets.strip.downcase

      i = input.to_i-1

      if input.to_i > 0
        list = @list[i] #line 22
        puts "#{i}. #{list.genre} - #{list.name} - #{list.book_description} - #{list.url}"
      elsif input == "Genres"
        puts "list.genre"
      elsif input == "more books"
        puts "list the next 10 books"
      elsif input ==  "exit"
        goodbye
      else
        puts "not sure what you want"
      end
    end
    end

    def goodbye
      puts "see you tomorrow"
    end

  end
