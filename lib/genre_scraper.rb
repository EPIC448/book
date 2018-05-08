class List_genre
    attr_accessor  :name, :url

    @@all_genre = []

#  def initialize(name, url)
#      @product_infor = product_infor
#      @url = url
#  end


 def self.genre
        doc = Nokogiri::HTML(open("http://books.toscrape.com"))

        doc.search("ul.nav.nav-list ul a").map do |container|
          genre = List_genre.new
          genre.name = container.text.strip     #works perfect
           genre.url = "http://books.toscrape.com/#{container.values.join}" 
          # doc.search("div.page_inner").children
          #works perfect
          @@all_genre << genre
        end
        @@all_genre # class variable
        end


      def self.all
        genre

      end

    


end