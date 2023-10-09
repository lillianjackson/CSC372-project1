require_relative 'RSScode' #access RSS code
require 'minitest/autorun'   #unit testing library
require 'minitest/spec'
require 'rss'  # Make sure to require the 'rss' gem
#to run in terminal put ruby Test.rb

class RSSCodeTest < Minitest::Test
  def setup
    @valid_url = 'https://www.ruby-lang.org/en/feeds/news.rss'
    @invalid_url = 'https://nonexistenturl.com/rss'
  end

  def test_valid_url_returns_array_with_titles
    result = RSScode(@valid_url)
    assert_kind_of Array, result
    assert result.any? { |item| item.start_with?('Title: ') }
  end

  def test_valid_url_returns_array_with_items
    result = RSScode(@valid_url)
    assert_kind_of Array, result
    assert result.any? { |item| item.start_with?('Item: ') }
  end

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
