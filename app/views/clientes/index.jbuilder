json.array!(@clientes) do |cliente|
    json.extract! cliente, :id, :nome, :telefone, :cpf, :created_at, :updated_at
end