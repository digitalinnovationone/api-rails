class CreateAdministradores < ActiveRecord::Migration[7.1]
  def change
    create_table :administradores do |t|
      t.string :nome, limit: 150
      t.string :email, limit: 255
      t.string :senha, limit: 255

      t.timestamps
    end
  end
end
