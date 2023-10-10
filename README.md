# CSC372-project1
Description: This project uses Ruby and several of its libraries to run. Firstly we created a RSS Feed reader to take a URL and parse through that URLs RSS feed and then print it back to the user. Then we had to use embedded Ruby along with the libraries of Sinatra and Puma to create the website to display it.

Tests: There are two test files for this code. They both make sure the RSS feed reader correctly split the code output. Test.rb is the unit tests to assert the code is correct. rspecTest.rb uses the rspec library to test teh output. To use Test.rb in terminal while in the code directory put in "ruby Test.rb" and the code will make the assertions. To run the rspec test input "rspec rspecTest.rb". 

How to run: Make sure you are in the code directory. In terminal put in "ruby app.rb". There will be two local host listed as "Listening on http:..." copy and paste that http into a search bar. There you will see the website display. Copy and paste the RSS feed url and the website will then display the feed parsed in a readable way. 