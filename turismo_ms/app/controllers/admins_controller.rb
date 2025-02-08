class AdminsController < ApplicationController
  before_action :require_admin

  def new
    @admin = Cliente.new
  end

  def create
    @admin = Cliente.new(admin_params)
    @admin.admin = true
    if @admin.save
      redirect_to root_path, notice: 'Admin criado com sucesso!'
    else
      Rails.logger.error(@admin.errors.full_messages)
      flash.now[:alert] = @admin.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def admin_params
    params.require(:cliente).permit(:nome, :email, :password, :password_confirmation)
  end

  def require_admin
    return if current_cliente && current_cliente.admin?

    redirect_to root_path, alert: 'Acesso negado.'
  end
end
