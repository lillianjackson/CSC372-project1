#Authors: Lillian Jackson and Prasiddhi Gyawali
#Purpose: create a rss feed reader in terminal

require 'sinatra'
require "./project1.rb"

=begin
  This is for the main display where the user enters the URL
=end
get '/' do
  erb :index
end

=begin
  This is for the second page after the url has been entered
  The code retrives the url and sends it to be parsed and then
  brings back the proper html code
=end
post '/process_url' do
  @url = params[:url]
  parse(@url)
end

