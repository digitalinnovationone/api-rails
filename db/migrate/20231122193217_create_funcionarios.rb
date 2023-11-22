class CreateFuncionarios < ActiveRecord::Migration[7.1]
  def change
    create_table :funcionarios do |t|
      t.string :nome, limit: 150
      t.string :registro, limit: 10
      t.datetime :data_nascimento

      t.timestamps
    end
  end
end
