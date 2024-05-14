require 'net/http'
require 'json'
require 'pp'
 
url = 'https://data.winnipeg.ca/resource/d3jk-hb6j.json?$limit=306000'
uri = URI(url)
response = Net::HTTP.get(uri)
trees_data = JSON.parse(response) # Convert JSON data into Ruby data.
#pp tree_data # pp stands for pretty print.

ash_tree_count = 0
trees_data.each do |tree|
    if tree['common_name'] && tree['common_name'].include?('ash')
        ash_tree_count += 1
    end
end

puts "Total ash trees: #{ash_tree_count}."