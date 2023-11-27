class ClientesController < ApplicationController
    def index
        per_page = 5
        page = params[:page] || 1
        page = params[:page].to_i < 1 ? 1 : params[:page].to_i

        # offset = ((page - 1) * per_page)

        # @clientes = Cliente.all

        # @clientes = @clientes.limit(per_page)
        # @clientes = @clientes.offset(offset)

        @clientes = Cliente.paginate(page: page, per_page: per_page)
    end

    def show
        @cliente = Cliente.find(params[:id])
    end

    def create
        @cliente = Cliente.new(clientes_params)
        return render "show", status: 201 if @cliente.save
        render json: @cliente.errors, status: 400
    end

    def update
        @cliente = Cliente.find(params[:id])
        return render "show", status: 200 if @cliente.update(clientes_params)
        render json: @cliente.errors, status: 400
    end

    def destroy
        Cliente.where(id: params[:id]).destroy_all
        render json: {}, status: 204
    end

    private
    def clientes_params
        params.permit(:nome, :telefone, :cpf)
    end
end
