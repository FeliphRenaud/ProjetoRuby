class ClientesController < ApplicationController
  layout 'authentication'

  before_action :require_admin, only: %i[index destroy]

  def new
    @cliente = Cliente.new
  end

  def create
    @cliente = Cliente.new(cliente_params)
    if @cliente.save
      redirect_to login_path, notice: 'Cliente cadastrado com sucesso, pode efetuar o seu login.'
    else
      flash.now[:alert] = @cliente.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @cliente = current_cliente
  end

  def update
    @cliente = current_cliente
    if @cliente.update(cliente_params)
      redirect_to root_path, notice: 'Perfil atualizado com sucesso!'
    else
      flash.now[:alert] = @cliente.errors.full_messages.to_sentence
      render :edit
    end
  end

  def client_management
    # Verifica  usuário logado é admin
    unless current_cliente && current_cliente.admin?
      redirect_to root_path, alert: 'Acesso negado.'
      return
    end

    # Carrega os administradores (exceto o admin logado) em ordem alfabética
    @admins = Cliente.where(admin: true)
                     .where.not(id: current_cliente.id)
                     .order(:nome)
    # Carrega os clientes não administradores em ordem alfabética
    @non_admins = Cliente.where(admin: false)
                         .order(:nome)

    # Renderiza usando o layout "application" (que possui header, footer, etc.)
    render layout: 'application'
  end

  # Ação para exclusão de um cliente
  def destroy
    @cliente = Cliente.find(params[:id])
    if @cliente == current_cliente
      redirect_to client_management_path, alert: 'Você não pode excluir sua própria conta.'
    else
      @cliente.destroy
      redirect_to client_management_path, notice: 'Cliente excluído com sucesso.'
    end
  end

  private

  def require_admin
    return if current_cliente && current_cliente.admin?

    redirect_to root_path, alert: 'Acesso negado. Somente administradores podem acessar esta página.'
  end

  def cliente_params
    params.require(:cliente).permit(:nome, :email, :password, :password_confirmation)
  end
end
