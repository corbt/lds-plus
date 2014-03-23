require 'nokogiri'
require 'open-uri'
require 'json'

base = "http://www.lds.org"

paths = [
  {
    "name" => "Old Testament",
    "path" => "/scriptures/ot"
  },
  {
    "name" => "New Testament",
    "path" => "/scriptures/nt"
  },
  {
    "name" => "Book of Mormon",
    "path" => "/scriptures/bofm"
  },
  {
    "name" => "Doctrine and Covenants",
    "path" => "/scriptures/dc-testament"
  },
  {
    "name" => "Pearl of Great Price",
    "path" => "/scriptures/pgp"
  }
]

def strip_path(path)
  path.gsub(/.*.org/, "").gsub(/\?.*/, "")
end

paths.each do |volume|
  books_url = "#{base}#{volume["path"]}"
  puts books_url
  books_page = Nokogiri::HTML(open(books_url))
  books = if books_page.css('.tocEntry').size > 0
    books_page.css('.tocEntry')
    else 
      books_page.css('ul.books li a')
    end
  volume["books"] = books.map do |book|
    chapters_page = Nokogiri::HTML(open(book.attr('href')))
    chapters = chapters_page.css('.jump-to-chapter li a').map do |c|
      {
        "name" => "#{volume['name']}/#{book.text}/#{c.text}",
        "path" => strip_path(c.attr('href'))        
      }
    end
    {
      "name" => "#{volume['name']}/#{book.text}",
      "path" => strip_path(book.attr('href')),
      "chapters" => chapters
    }
  end
end

File.open("paths.json", "w") do |f|
  f.write JSON.pretty_generate(paths)
end