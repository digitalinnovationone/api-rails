class PerfilAdm < ActiveRecord::Migration[7.1]
  def change
    add_column :administradores, :perfil, :string, limit: 20
  end
end
