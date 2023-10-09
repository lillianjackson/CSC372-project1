# This is a version of the RSS code without the client server for testing
require 'rss'
require 'open-uri'

def RSScode(url)
  arr = []
  begin
    URI.open(url) do |rss|
      feed = RSS::Parser.parse(rss)
      puts "Title: #{feed.channel.title}"
      arr.push("Title: #{feed.channel.title}")
      feed.items.each do |item|
        puts "Item: #{item.title}"
        arr.push("Item: #{item.title}")
      end
    end
  rescue StandardError => e
    # Handle the error and return an empty array
    puts "Error: #{e.message}"
    arr = []
  end


  puts "Goodbye"
  return arr
end