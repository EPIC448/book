
# class Book::SoloBook
#     #note, we do not need base path here
#     attr_accessor :genre, :name, :book_description, :product_information, :price, :book_url
#     #shift Q to get back in pry
#          @@all = []
           
#          def initialize(list_hash)
#                 # iterates over list_hash
#                 list_hash.each do |key, value|
#     # genres_url = nested_genres.each {|key, value| puts "#{key} is #{value}" }
#                 self.send("#{key}=", value)
#                 # note self = "travel"

#                 end
#                 @@all << self
#             end

#            def self.all
#             @@all
#            end
        
#         #    ^^^ every thing works up to here ^^^^

#     def self.create_genre_books(genre_url) #you got this.
#         Book_scraper.scrape_book(genre_url)

#     end


# def add_student_attributes(attributes_in_hash) # used in command line 29. attribute_hash is passed in
#     #attr  in this case is a KEY =  :twitter and VALUE = "https://twitter.com/empireofryan"
#     attributes_hash.each do |attr, value| 
#       self.send("#{attr}=", value)
#     end
#     self
#   end


# end