class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
    def new
    end
  
    def create
      cliente = Cliente.find_by(email: params[:email])
  
      if cliente && cliente.authenticate(params[:password])
        session[:cliente_id] = cliente.id
        redirect_to root_path, notice: "Login realizado com sucesso!"
      else
        flash.now[:alert] = "Email ou senha inválidos"
        render :new
      end
    end
  
    def destroy
      session[:cliente_id] = nil  # Limpa a sessão
      redirect_to root_path, notice: "Logout realizado com sucesso!"
    end
end
