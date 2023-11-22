class ApplicationController < ActionController::API
    before_action :autenticacao, :perfil

    private

    def perfil
        if @adm.present? && @adm.perfil != "ADM" && ["update", "destroy"].include?(params[:action])
            return render json: { erro: "Administrador de perfil Editor não pode atualizar e nem apagar registros"}, status: 403
        end
    end

    def autenticacao
        header_auth = request.headers['Authorization']
        return render json: { erro: "Token Bearer obrigatório"}, status: 401 if header_auth.blank?
        token = header_auth.split(' ').last

        begin
            token_decoded = JWT.decode(token, TOKEN_JWT)
            id = token_decoded.first["data"]["id"] rescue 0
            @adm = Administrador.find(id)
        rescue => exception
            render json: { erro: "Token inválido"}, status: 401
        end
    end
end
