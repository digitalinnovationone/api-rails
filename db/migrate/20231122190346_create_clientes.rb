class CreateClientes < ActiveRecord::Migration[7.1]
  def change
    create_table :clientes do |t|
      t.string :nome, limit: 150
      t.string :telefone, limit: 20
      t.string :cpf, limit: 20

      t.timestamps
    end
  end
end
