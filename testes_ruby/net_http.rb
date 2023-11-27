require 'net/http'
require 'byebug'
require 'json'


uri = URI('http://127.0.0.1:3000/administradores/login')
data = { email: "danilo@teste.com", senha: "1234567" }.to_json
headers = { 'Content-Type' => 'application/json' }
response = Net::HTTP.post(uri, data, headers)

if (200...300).include?(response.code.to_i)
    token = JSON.parse(response.body)["token"]
    response = Net::HTTP.get(URI('http://127.0.0.1:3000/clientes'), {'Authorization' => "Bearer #{token}", 'Content-Type' => 'application/json'})

    begin
        clientes = JSON.parse(response)
        if clientes.length > 0
            clientes.each do |cliente|
                puts "------------------"
                puts "ID: #{cliente["id"]}"
                puts "Nome: #{cliente["nome"]}"
            end
        end
    rescue Exception => err 
        puts err.message
    end
end