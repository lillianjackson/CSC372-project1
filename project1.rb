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

def parse(url)
  ret = ""
  URI.open(url) do |rss|
    feed = RSS::Parser.parse(rss)
    ret += "<h1 style='margin-bottom:60px;'>#{feed.channel.title}</h1>"
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
      ret += "<a href='#{item.link}' target='_blank'>Read More</a></div>"
    end
  end
  return ret
end
