class AdministradoresController < ApplicationController
  before_action :set_administrador, only: %i[ show update destroy ]
  skip_before_action :autenticacao, only: [:login]

  def login
    @administrador = Administrador.where(email: params[:email]).first
    if params[:senha].blank? || @administrador.senha != BCrypt::Engine.hash_secret(params[:senha], @administrador.salt)
      return render json: { erro: "Login ou senha inválido" }, status: 400 if @administrador.blank?
    end

    @administrador.atualizar_senha!(params[:senha])
    
    payload = {
      data: {
        id: @administrador.id,
        nome: @administrador.nome,
        email: @administrador.email,
        perfil: @administrador.perfil
      },
      exp: Time.now.to_i + 3600
    } # Expira em 1 hora

    token = JWT.encode(payload, TOKEN_JWT, 'HS256')

    return render json: {
      nome: @administrador.nome,
      email: @administrador.email,
      token: token
    }
  end

  # GET /administradores
  # GET /administradores.json
  def index
    @administradores = Administrador.all
  end

  # GET /administradores/1
  # GET /administradores/1.json
  def show
  end

  # POST /administradores
  # POST /administradores.json
  def create
    @administrador = Administrador.new(administrador_params)

    if @administrador.save
      render :show, status: :created, location: @administrador
    else
      render json: @administrador.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /administradores/1
  # PATCH/PUT /administradores/1.json
  def update
    if @administrador.update(administrador_params)
      render :show, status: :ok, location: @administrador
    else
      render json: @administrador.errors, status: :unprocessable_entity
    end
  end

  # DELETE /administradores/1
  # DELETE /administradores/1.json
  def destroy
    @administrador.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_administrador
      @administrador = Administrador.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def administrador_params
      params.require(:administrador).permit(:nome, :email, :senha)
    end
end
