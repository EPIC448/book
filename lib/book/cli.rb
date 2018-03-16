
class Book::Cli


    def list_books
       @book_scraper = Book::Book_scraper.scraper
       @book_scraper.each.with_index(1) do | list,i|
          puts "#{i}. #{list.genre} - #{list.name} - #{list.book_description}"
    end
    end

      def option
          put "users choices"
      end
end
