require 'net/http'
require 'json'
require 'pp'
 
url = 'https://data.winnipeg.ca/resource/d3jk-hb6j.json?$limit=306000'
uri = URI(url)
response = Net::HTTP.get(uri)
tree_data = JSON.parse(response) # Convert JSON data into Ruby data.
#pp tree_data # pp stands for pretty print.

ash_count = 0
tree_data.each do |tree|
    if tree['common_name'] && tree['common_name'].include?('ash')
        ash_count += 1
    end
end

puts "Total ash trees: #{ash_count}."