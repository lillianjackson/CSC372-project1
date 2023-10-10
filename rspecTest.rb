# rss_code_spec.rb: designed ot test functionality of the RSScode which is implemented in Project1.rb
# to run put rspec rspecTest.rb
require 'rspec' #rspect testing library
require_relative 'RSScode' # Make sure to require your RSS code file

RSpec.describe 'RSScode' do #define the rspec suite for the RSS code 
  context 'with a valid URL' do #define context for testing the behavior of RSScode with a valid URL
    let(:valid_url) { 'https://www.ruby-lang.org/en/feeds/news.rss' } #create a valid URL to test with that has a valid RSS feed

    #test whether RSSCode returns an array with titles
    it 'returns an array with titles' do
      result = RSScode(valid_url)
      expect(result).to be_an(Array) #output is expected to be an array
      expect(result).to include(a_string_starting_with('Title: ')) # expect array to have a string starting with 'Title: '
    end

    #test if the array returns with items
    it 'returns an array with items' do
      result = RSScode(valid_url) #returned array
      expect(result).to be_an(Array)  #making sure that an array was returned
      expect(result).to include(a_string_starting_with('Item: ')) # making sure the result includes a string that starts with 'Item: '
    end
  end
# define was the context would be for testing the RSScode if it is given a invalid URL
  context 'with an invalid URL' do
    #create a variable with an invalid RSS feed URL
    let(:invalid_url) { 'https://nonexistenturl.com/rss' }
    #test whether the code returns an empty array
    it 'returns an empty array' do
      result = RSScode(invalid_url)
      expect(result).to eq([])  #expected an empty array
    end
  end
end
