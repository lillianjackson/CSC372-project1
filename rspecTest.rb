# rss_code_spec.rb
# to run put rspec rspecTest.rb
require 'rspec'
require_relative 'RSScode' # Make sure to require your RSS code file

RSpec.describe 'RSScode' do
  context 'with a valid URL' do
    let(:valid_url) { 'https://www.ruby-lang.org/en/feeds/news.rss' }

    it 'returns an array with titles' do
      result = RSScode(valid_url)
      expect(result).to be_an(Array)
      expect(result).to include(a_string_starting_with('Title: '))
    end

    it 'returns an array with items' do
      result = RSScode(valid_url)
      expect(result).to be_an(Array)
      expect(result).to include(a_string_starting_with('Item: '))
    end
  end

  context 'with an invalid URL' do
    let(:invalid_url) { 'https://nonexistenturl.com/rss' }

    it 'returns an empty array' do
      result = RSScode(invalid_url)
      expect(result).to eq([])
    end
  end
end
