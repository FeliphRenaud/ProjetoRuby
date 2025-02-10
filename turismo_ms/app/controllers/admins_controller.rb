class AdminsController < ApplicationController
  def new
    @admin = Cliente.new
  end

  def create
    @admin = Cliente.new(admin_params.merge(admin: true))
    if @admin.save
      redirect_to root_path, notice: 'Admin criado com sucesso!'
    else
      render :new
    end
  end

  private

  def admin_params
    params.require(:cliente).permit(:nome, :email, :password, :password_confirmation)
  end
end
