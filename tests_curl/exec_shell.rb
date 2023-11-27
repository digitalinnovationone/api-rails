require 'json'

# dados = `curl -X GET 'http://127.0.0.1:3000/'`
dados = `sh get_home.sh`

# require 'byebug'
# debugger

dados = JSON.parse(dados)

puts dados["mensagem"]
puts dados["endpoints"]
