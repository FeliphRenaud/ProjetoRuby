class SessionsController < ApplicationController
  layout 'authentication'
  skip_before_action :verify_authenticity_token
  before_action :redirect_if_logged_in, only: %i[new create]

  def new
  end

  def create
    cliente = Cliente.find_by(email: params[:email])
    if cliente && cliente.authenticate(params[:password])
      session[:cliente_id] = cliente.id
      redirect_to root_path, notice: 'Login realizado com sucesso!'
    else
      flash.now[:alert] = 'Email ou senha inválidos'
      render :new
    end
  end

  def destroy
    session[:cliente_id] = nil # Limpa a sessão
    redirect_to root_path, notice: 'Logout realizado com sucesso!'
  end

  private

  def redirect_if_logged_in
    return unless current_cliente

    redirect_to root_path, notice: 'Você já está logado.'
  end
end
