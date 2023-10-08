#Authors: Lillian Jackson and Prasiddhi Gyawali
#Purpose: create a rss feed reader in terminal
#Resources used for reference: https://www.codementor.io/projects/web/rss-feed-reader-website-atx32j280x
# https://medium.com/@krandles/rss-and-ruby-its-really-simple-a32a8654733a


=begin
this is a basic outline of the project

first we need to get the user to give a url to a website 
then we need to figureout how to rss into the website to display the title desritption of the website and link to original content

there are a couple of other challenges we could do but we should get the basics done first and see if we have time to implement the rest 
=end

require 'rss'
require 'open-uri'
require 'socket'

server = TCPServer.new(1337)

loop do
    client = server.accept

# client.puts "What's your name?"
# input = client.gets
# puts "Received #{input.chomp} from a client socket on 1337"
# client.puts "Hi, #{input.chomp}! You've successfully connected to the server socket."

# url = gets 
# client.puts "Your URL #{url}"
#sputs url
#url = 'https://medium.com/feed/@olegchursin/'

client.puts "Enter URL"
url = client.gets.chomp
client.puts "Your URL #{url}"

open(url) do |rss|
  feed = RSS::Parser.parse(rss)
  client.puts "Title: #{feed.channel.title}"
  feed.items.each do |item|
    client.puts "Item: #{item.title}"
  end
end


client.puts "Goodbye #{input}"
  client.close
end

