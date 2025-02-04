class ApplicationController < ActionController::Base
    
  helper_method :current_cliente

  private

  def current_cliente
    # Procura pelo id está na sessão
    @current_cliente ||= Cliente.find_by(id: session[:cliente_id])
  end
end
