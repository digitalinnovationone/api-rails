require 'httparty'

class ClienteHttpParty
    include HTTParty

    base_uri "http://127.0.0.1:3000"

    def initialize(token="")
        @token = token
    end

    def login!(email, senha)
        url = '/administradores/login'
        headers = { 'Content-Type' => 'application/json' }
        body = { email: email, senha: senha }.to_json

        response = self.class.post(url, body: body, headers: headers)

        if (200...300).include?(response.code)
            body_content = JSON.parse(response.body)
            @token = body_content['token']
        end
    end

    def get_clientes_paginado(page = 1)
        puts "*** Buscando dados pagina #{page} ****"

        url = "/clientes?page=#{page}"
        headers = { 
            'Content-Type' => 'application/json', 
            'Authorization' => "Bearer #{@token}" 
        }

        response = self.class.get(url, headers: headers)

        if (200...300).include?(response.code)
            clientes = JSON.parse(response.body)
            if clientes.length > 0
                clientes.each do |cliente|
                    puts "------------------"
                    puts "ID: #{cliente["id"]}"
                    puts "Nome: #{cliente["nome"]}"
                end

                get_clientes_paginado(page + 1)
            end
        end
    end
end