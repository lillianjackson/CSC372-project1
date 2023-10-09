require "./project1.rb"
class App
  def call(env)
    headers = {'Content-Type' => 'text/html'}
    response = [parse('https://rss.nytimes.com/services/xml/rss/nyt/Soccer.xml')]
    [200, headers, response]
  end

end

run App.new