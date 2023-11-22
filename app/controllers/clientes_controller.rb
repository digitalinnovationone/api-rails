class ClientesController < ApplicationController
    def index
        @clientes = Cliente.all
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
