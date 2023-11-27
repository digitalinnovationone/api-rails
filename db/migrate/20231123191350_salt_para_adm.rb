class SaltParaAdm < ActiveRecord::Migration[7.1]
  def change
    add_column :administradores, :salt, :string, limit: 255
  end
end
