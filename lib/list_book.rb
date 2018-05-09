
class List

    #dont for get to add "self" to your methods.
    
    attr_accessor :name, :price, :book_info

         @@all_book = []
           
        #  def initialize(book_name)
        #     @book_name = book_name
        # end
               

    
    def self.book_url

        genre = List_genre.all
        genre.each do |each_genre|
        content = each_genre.url
        content  
    
        #each content is already iterated over.
       #need an if else statment.. here...
         doc = Nokogiri::HTML(open(content))   #note content URL link
         book = doc.search ("h3 a")
         list = List.new
           list.name = book.children.text
           list.name
        
        list.name

        @@all_book << list.name
        #  content.css("body > div > div > div > div > section > div:nth-child(2) > ol > li:nth-child(2) > article > h3 > a").text

          # doc.search("body > div > div > div > div > section > div:nth-child(2) > ol > li > article > h3 > a[1]").text
          end
          @@all_book
      
      end
    
      

  def self.all
    book_url
  end


  def self.find(id)
    binding.pry
    self.book_url[id.to_i - 1] # find by id
    
    # it either find genre by Id
    # or books by Id
  end
  
end
