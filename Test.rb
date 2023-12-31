require_relative 'RSScode' #access RSS code
require 'minitest/autorun'   #unit testing library
require 'minitest/spec' #enable rspec stye test specifications
require 'rss'  # Make sure to require the 'rss' gem for parsing
#to run in terminal put ruby Test.rb

#define the class that inherits from Minitest::Test
class RSSCodeTest < Minitest::Test
  def setup
    # gice the valid and invalid urls
    @valid_url = 'https://www.ruby-lang.org/en/feeds/news.rss'
    @invalid_url = 'https://nonexistenturl.com/rss'
  end

  #this will test whether the valid url will return titles
  def test_valid_url_returns_array_with_titles
    result = RSScode(@valid_url)
    assert_kind_of Array, result  #assert the result is an instance of array class
    assert result.any? { |item| item.start_with?('Title: ') } #assert the return contains items that start with title
  end
  #tests whether the RSScode will return an array with items when given a valid URL
  def test_valid_url_returns_array_with_items
    result = RSScode(@valid_url)
    assert_kind_of Array, result  #assert given back an array
    assert result.any? { |item| item.start_with?('Item: ') } #assert the result has a string with the label items
  end

  #makes sure if given an invalid URL that it will return an empty array
  def test_invalid_url_returns_empty_array
    result = RSScode(@invalid_url)
    assert_kind_of Array, result
    assert_empty result
  end

  def test_rsscode_with_valid_url
    # Define the expected array of values
    expected_array = ["Title: Stories by Oleg Chursin on Medium", "Item: Communicate Risk with Git Commits", "Item: Notes on Better User Stories", "Item: Native datetime formatter", "Item: AWS Certified Security Specialty Exam — Practice Questions", "Item: AWS Certified Security — Specialty | Infrastructure Security (notes)", "Item: AWS Certified Security — Specialty | Logging and Monitoring (notes)", "Item: AWS Certified Security — Specialty | Incident response (notes)", "Item: Gatsby Auth with AWS Amplify", "Item: Rename local and remote git branches", "Item: How to Upgrade to Webpack 4"]

    # Print URL to the screen
    url = 'https://medium.com/feed/@olegchursin/'
    url = url.strip # Strip the whitespace from the URL
    puts "Your URL: #{url}" # Print the URL just given to the program

    # Call RSScode method
    arr = RSScode(url)

    # Compare the result with the expected array
    assert_equal expected_array, arr
  end
end
