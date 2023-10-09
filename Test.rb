require_relative 'RSScode' #access RSS code
require 'minitest/autorun'   #unit testing library


testArr = ["Title: Stories by Oleg Chursin on Medium","Item: Communicate Risk with Git Commits","Item: Notes on Better User Stories","Item: Native datetime formatter","Item: AWS Certified Security Specialty Exam — Practice Questions","Item: AWS Certified Security — Specialty | Infrastructure Security (notes)", "Item: AWS Certified Security — Specialty | Logging and Monitoring (notes)","Item: AWS Certified Security — Specialty | Incident response (notes)","Item: Gatsby Auth with AWS Amplify", "Item: Rename local and remote git branches", "Item: How to Upgrade to Webpack 4"]

#print url to the screen
url = 'https://medium.com/feed/@olegchursin/       '
url = url.strip #strip the white space from the url given
puts "Your URL: #{url}" #print the url just given to the program
#call rss code method
arr = RSScode(url)

if arr == testArr
    puts " Test one pass"
    
else
    puts "fail"
end
