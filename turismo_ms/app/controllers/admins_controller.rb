class AdminsController < ApplicationController
  def new
    @admin = Cliente.new
  end

  def create
    @admin = Cliente.new(admin_params.merge(admin: true))
    if @admin.save
      redirect_to root_path, notice: 'Admin criado com sucesso!'
    else
      puts @admin.errors.full_messages # Exibe erros de validacao no console
      render :new
    end
  end

  private

  def admin_params
    params.require(:cliente).permit(:nome, :email, :password, :password_confirmation, :admin)
  end
end
