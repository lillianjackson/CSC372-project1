require 'sinatra'
require "./project1.rb"

get '/' do
  erb :index
end

post '/process_url' do
  @url = params[:url]
  parse(@url)
end

