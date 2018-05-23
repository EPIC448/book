require_relative "./version.rb"
require_relative './cli.rb'
require_relative './list_book.rb'

# this is execution folder.
 require 'open-uri'
 require 'pry'
 require 'nokogiri'
 require 'require_all'

 require_all 'lib'



#  object_book.book_info = Nokogiri::HTML(open("http://books.toscrape.com/catalogue/#{book.values.first.gsub('../','')}"))

