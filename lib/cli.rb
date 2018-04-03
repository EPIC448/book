require_relative "./book_scraper"
require_relative "./solo_book"

require 'nokogiri' 
# require 'colorize'
require 'pry'

class Cli
  BASE_PATH = true # we most add value to this places... 

  def self.list_books
    book_array = book_scraper.scrape_genre
    # Book.indicate_genre(book_array)   # create a method in genre.rb that breaks this down.
    book_array
    binding.pry
    
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
