
class SoloBook
    #note, we do not need base path here
    attr_accessor :genre, :name, :book_description, :product_information, :price, :book_url
    #shift Q to get back in pry
         @@all = []
           
         def initialize(list_hash)
                # iterates over list_hash
                list_hash.each do |key, value|
    # genres_url = nested_genres.each {|key, value| puts "#{key} is #{value}" }
                self.send("#{key}=", value)
                # note self = "travel"

                end
                @@all << self
            end

           def self.all
            @@all
           end
        
        #    ^^^ every thing works up to here ^^^^


    #get item from the scraper... 
    # to the cLI.. than has a method  from the Solo_book.rb
    # work on the  passed in method  from scraper.genre

    def self.create_genre_books(genre_url) #you got this.
        binding.pry
        book_array.each do |list_hash|
            # we set it to go into in interalize method to 
            #create a new object
            SoloBook.new(list_hash)     
        end
    end

# part 2
# self.scrape_book.. 
#   will give each of the books in the genre.

def add_student_attributes(attributes_in_hash) # used in command line 29. attribute_hash is passed in
    #attr  in this case is a KEY =  :twitter and VALUE = "https://twitter.com/empireofryan"
    attributes_hash.each do |attr, value| 
      self.send("#{attr}=", value)
    end
    self
  end


end