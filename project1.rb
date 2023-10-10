#Authors: Lillian Jackson and Prasiddhi Gyawali
#Purpose: create a rss feed reader in terminal
#Resources used for reference: https://www.codementor.io/projects/web/rss-feed-reader-website-atx32j280x
# https://medium.com/@krandles/rss-and-ruby-its-really-simple-a32a8654733a

require 'rss'
require 'open-uri'
require 'socket'

=begin
  This function takes in a url and parses it then. It then returns the proper
  html code that must be used to display this information
=end
def parse(url)
  ret = ""
  URI.open(url) do |rss|
    feed = RSS::Parser.parse(rss)
    ret += "<body style='margin:50px'><h1 style='margin-bottom:60px;'>#{feed.channel.title}</h1>"
    feed.items.each do |item|
      ret += "<div style='margin-bottom:50px;'><h3>#{item.title}</h3>"
      ret += "<p><strong>Published:</strong> #{item.pubDate}</p>"
      ret += "<p><strong>Description:</strong> #{item.description}</p>"
      related = Array.new
      item.categories.each do |sub|
          related.push(sub.content)
      end
      if related.length > 0
        ret += "<p><strong>Related Topics:</strong> #{related.inspect}</p>"
      end
      ret += "<a href='#{item.link}' target='_blank'>Read More</a></div></body>"
    end
  end
  return ret
end
