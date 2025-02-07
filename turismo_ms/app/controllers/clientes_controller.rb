class ClientesController < ApplicationController
  layout 'authentication'
  def new
    @cliente = Cliente.new
  end

  def create
    @cliente = Cliente.new(cliente_params)
    if @cliente.save
      redirect_to root_path, notice: 'Cadastro realizado com sucesso!'
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

  private

  def cliente_params
    params.require(:cliente).permit(:nome, :email, :password, :password_confirmation)
  end
end
