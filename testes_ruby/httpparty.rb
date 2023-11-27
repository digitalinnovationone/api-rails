require 'httpparty'

url = 'http://127.0.0.1:3000/'
response = HTTParty.get(url)

# require 'byebug'
# debugger

puts "Response code: #{response.code}"
puts "Response body: #{response.body}"

body_content = JSON.parse(response.body)

puts "mensagem: #{body_content["mensagem"]}"