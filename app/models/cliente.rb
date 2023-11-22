class Cliente < ApplicationRecord
    validates :nome, :cpf, :telefone, presence: true
    validates :cpf, :telefone, uniqueness: true
end
