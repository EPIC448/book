
class SoloBook
    #note, we do not need base path here
    attr_accessor :genre, :name, :book_description, :product_information, :price, :book_url
    #shift Q to get back in pry

                # @@all = []
                
                # def initialize()
                #iterates over key values pairs from Book_scraper.
    # # genres_url = nested_genres.each {|key, value| puts "#{key} is #{value}" }

                # end



    #get item from the scraper... 
    # to the cLI.. than has a method  from the Solo_book.rb
    # work on the  passed in method  from scraper.genre

    def self.create_genre_collection(book_array)
        book_array.each do |list_hash|
            # we set it to go into in interalize method to 
            #create a new object
            SoloBook.new(list_hash)     
        end
    end

# part 2
# self.scrape_book.. 
#   will give each of the books in the genre.
end