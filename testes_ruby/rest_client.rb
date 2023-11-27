require 'rest-client'
require 'byebug'
require 'json'

response = RestClient.post 'http://127.0.0.1:3000/administradores/login', {"email": "danilo@teste.com", "senha": "1234567"}

if (200...300).include?(response.code)
    token = JSON.parse(response.body)["token"]
    response = RestClient.get('http://127.0.0.1:3000/clientes', {'Authorization' => "Bearer #{token}", 'Content-Type' => 'application/json'})
    
    if (200...300).include?(response.code)
        clientes = JSON.parse(response.body)
        if clientes.length > 0
            clientes.each do |cliente|
                puts "------------------"
                puts "ID: #{cliente["id"]}"
                puts "Nome: #{cliente["nome"]}"
            end
        end
    end
end