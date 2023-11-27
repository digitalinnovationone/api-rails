class Administrador < ApplicationRecord
    validates :nome, :email, :senha, presence: true
    validates :email, uniqueness: true

    before_save do 
        unless self.senha_criptografada?
            self.criptografa_senha(self.senha)
        end
    end

    def criptografa_senha(senha_descriptografada)
        self.salt = BCrypt::Engine.generate_salt
        self.senha = BCrypt::Engine.hash_secret(senha_descriptografada, self.salt)
    end

    def atualizar_senha!(senha_descriptografada)
        self.criptografa_senha(senha_descriptografada)
        Administrador.where(id: self.id).update_all(salt: self.salt, senha: self.senha)
    end

    private

    def senha_criptografada?
        BCrypt::Password.valid_hash?(self.senha)
    end
end
