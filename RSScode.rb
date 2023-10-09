# This is a version of the RSS code without the client server for testing
require 'rss'
require 'open-uri'

def RSScode(url)
  arr = Array.new
  URI.open(url) do |rss|
    feed = RSS::Parser.parse(rss)
    puts "Title: #{feed.channel.title}"
    arr.push("Title: #{feed.channel.title}")
    feed.items.each do |item|
      puts "Item: #{item.title}"
      arr.push("Item: #{item.title}")
    end
  end


  puts "Goodbye"
  return arr
end
