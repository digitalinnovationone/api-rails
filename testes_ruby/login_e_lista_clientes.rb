
def listar_clientes(page, token)
    puts "*** Buscando dados pagina #{page} ****"

    url = "http://127.0.0.1:3000/clientes?page=#{page}"
    headers = { 
        'Content-Type' => 'application/json', 
        'Authorization' => "Bearer #{token}" 
    }

    response = HTTParty.get(url, headers: headers)

    if (200...300).include?(response.code)
        clientes = JSON.parse(response.body)
        if clientes.length > 0
            clientes.each do |cliente|
                puts "------------------"
                puts "ID: #{cliente["id"]}"
                puts "Nome: #{cliente["nome"]}"
            end

            listar_clientes(page + 1, token)
        end
    end
end

page = ARGV[0].to_i || 1
page = page < 1 ? 1 : page

require 'httparty'

url = 'http://127.0.0.1:3000/administradores/login'
headers = { 'Content-Type' => 'application/json' }
body = { email: "danilo@teste.com", senha: "1234567" }.to_json

response = HTTParty.post(url, body: body, headers: headers)

# puts "Response code: #{response.code}"
# puts "Response body: #{response.body}"

if (200...300).include?(response.code)
    body_content = JSON.parse(response.body)
    token = body_content['token']

    listar_clientes(page, token)
end
