Episode 7 - Salesman Traveler
=====================

An o(n!) algorithm to travel the globe as fast as possible

Panda Level
-----------

1. Implement your own route for errands around town. Is the algorithm making the same choices you would?
2. Instead of assuming the first point is your starting point, tell the SalesPerson what their starting point is

Tiger Level
-----------

1. Implement benchmarking code to see how long it will take to calculate for 2, 10, 50, and 200
2. Sample benchmarking code: http://rubyfiddle.com/riddles/68404

Eagle Level
-----------

1. Implement the "salesperson should log the total miles"
2. Output the total traveling time (assume 55 mph)

Extra Extra: (This is really out there): Implement the Djikstra algorithm (http://blog.linkedin.com/2008/09/19/implementing-di/) to effmore effective route the network

Show Links
----------

http://www.quora.com/Computational-Complexity-Theory/Is-the-traveling-salesman-problem-solvable 
http://www.rubygeocoder.com/

Sample Nokogiri Code
--------------------

```
require 'nokogiri'
require 'open-uri'
doc = Nokogiri::HTML(open('http://www.texas.gov/en/discover/Pages/topic.aspx?topicid=/government/localgov'))
doc.css(".TGOV_SCRD_Header a").map do |node|
  node.content
end
```

Check out http://www.city-data.com/ for US-wide list of cities.

MD Citites
----------
```
require 'nokogiri'
require 'open-uri'
doc = Nokogiri::HTML(open("http://www.msa.md.gov/msa/mdmanual/01glance/html/mun.html"))
doc.css("ul a").map {|node| node.content}.reject{|i| i.include? "\n"}
```

VA Citites
----------
```
require 'nokogiri'
require 'open-uri'
doc = Nokogiri::HTML(open("http://www.areavibes.com/va/"))
doc.css(".col a").map {|node| node.content}
```

Copyright: Jesse Wolgamott, MIT License (See LICENSE)
