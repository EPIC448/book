
class List

    #dont for get to add "self" to your methods.
    
    attr_accessor :book_name

         @@all_book = []
           
    #      def initialize(book)
    #         @book = book
    #     end
    #             @@all << self
    #     end

    #      def self.all
    #         @@all
    #     end
    


    
    def self.book_url
        genre = List_genre.all
        genre.each do |genre|
        content = genre.url
        content  
    
         doc = Nokogiri::HTML(open(content))
          check = doc.search ("h3 a")
          check.each do |name|
        #   =>  name = #(Element:0x3fe3fb008e48 {
#   name = "a",
#   attributes = [
#     #(Attr:0x3fe3facbd324 { name = "href", value = "../../../its-only-the-himalayas_981/index.html" }),
#     #(Attr:0x3fe3facbd2d4 { name = "title", value = "It's Only the Himalayas" })],
#   children = [ #(Text "It's Only the Himalayas")]

thumbnail = name.css("a.attribute")
binding.pry
href = thumbnail[0]['href']
            
            binding.pry
          

        #  get_book = List.new



        #  book_name =list

          end
        #  we start scraping

    #     book_name = "i list all books"
        
    #     @@all_book << get_book
   
    #        #checked and good to go
       end
      
    end


  def self.all
    book_url

  end

  
end

