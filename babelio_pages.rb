#!/usr/bin/env ruby

require 'csv'
require 'net/http'

STDOUT.sync = true

pages = []
uri = URI('http://openisbn.com')

Net::HTTP.start(uri.host, uri.port) do |http|
  CSV.foreach('biblio.csv', col_sep: ';', headers: true, converters: :all) do |row|

    unless row['Statut'] == 'Lu'
      print '-'
      next
    end

    http.head("/isbn/#{row['ISBN']}")
    metadata = http.get("/download/#{row['ISBN']}.txt").body

    book_pages = metadata.lines.map{ |line|
      line.gsub! /\APages\s*:\s*(\d+)/, '\1'
    }.compact.first.to_i

    if book_pages > 0
      pages << book_pages
      print '.'
    else
      print 'E'
    end
  end
end

lowest_pages = pages.min
highest_pages = pages.max
total_pages = pages.inject(:+)
nb_books = pages.length
average_pages = (total_pages / nb_books)

def median(aray)
  sorted = aray.sort
  alen = sorted.length
  (sorted[(alen-1)/2] + sorted[alen/2]) / 2
end

puts <<-EOS

You've read #{total_pages} pages from #{nb_books} books.

== Stats ===============
The thinest book has #{lowest_pages} pages
The bigger book has #{highest_pages} pages
The average pages per book is #{average_pages}
The median pages per book is #{median(pages)}
EOS
