#Purpose: simiplified version of an  RSS feed parser
# gets the rss feed from a given URL and parses it. Does not have any client
#serve interactions and is designed to test we are coding the parser right 
require 'rss' #respire rss library for RSS Feed Parsing
require 'open-uri' #require library for URL retriveval

#define the rsscode method which will take the URL as a parameter
#and return an array of the feed information that was parsed
def RSScode(url)
  #initialize empy array to put the parsed information
  arr = []
  begin
    #open the url to access the rss feed
    URI.open(url) do |rss|
      #parse the rss feed
      feed = RSS::Parser.parse(rss)
      #display and store teh title of the RSS feed
      puts "Title: #{feed.channel.title}"
      arr.push("Title: #{feed.channel.title}")
      #go through the feed items and display their titles as well as store them in array
      feed.items.each do |item|
        puts "Item: #{item.title}"
        arr.push("Item: #{item.title}")
      end
    end
  rescue StandardError => e
    # Handle the error and return an empty array
    puts "Error: #{e.message}"
    arr = []  #set the array to empty in case of error 
  end

  #display goodbye message after the rss feed has been finished being parses and added to array
  puts "Goodbye"
  return arr
end