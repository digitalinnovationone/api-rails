class Cliente < ApplicationRecord
    validates :nome, :cpf, :telefone, presence: true
    validates :cpf, :telefone, uniqueness: true

    validate :cpf_validar

    private

    def cpf_validar
        unless CpfUtilsDio::cpf_valido?(self.cpf)
            errors.add(:cpf, "inválido")
        end
    end
end
