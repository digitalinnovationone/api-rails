class Cliente < ApplicationRecord
    validates :nome, :cpf, :telefone, presence: true
    validates :cpf, :telefone, uniqueness: true

    validate :cpf_validar

    private

    def cpf_validar
        unless CpfUtils::cpf_valido?(self.cpf)
            errors.add(:cpf, "inválido")
        end
    end
end
