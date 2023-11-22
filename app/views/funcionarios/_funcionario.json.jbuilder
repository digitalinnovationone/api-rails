json.extract! funcionario, :id, :nome, :registro, :data_nascimento, :created_at, :updated_at
json.url funcionario_url(funcionario, format: :json)
