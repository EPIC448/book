class Book::Cli


    def list_books
       @book_scraper = Book::Book_scraper.scraper
       @book_scraper.each.with_index(1) do | list,i|
          puts "#{i}. #{list.genre} - #{list.name} - #{list.book_description}"
    end

      def option
          put "users choices"

      end
end


# Scrape the books.toscrape site.
# A user should be presented with a list of Book Genres to select from.
# Once a user selects a genre, they should then be presented with a list of book names from that genre.
# The user should only see the first ten books, there should be an option for the user to either select from that list or see the next set of ten books.
# A user can then select a book and be given the books name, the Product description, and its product information.
# The user should be able to then see the book list again, start over or exit the gem.
