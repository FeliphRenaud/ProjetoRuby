class PostsController < ApplicationController
  # invoca o metodo require_admin antes de executar o CRUD
  before_action :require_admin, only: %i[new create edit update destroy]

  # private

  def require_admin
    # Se o cliente nao estiver logado ou nao for um admin , acesso bloqueado.
    return if current_cliente && current_cliente.admin?

    render json: { error: 'Acesso negado. Somente administradores podem realizar essa ação.' }, status: :unauthorized
  end

  def index
    if params[:q].present?
      query = "%#{params[:q]}%"
      @posts = Post.where('titulo ILIKE ? OR subtitulo ILIKE ? OR descricao ILIKE ? OR palavra_chave ILIKE ?', query,
                          query, query, query)
                   .order(created_at: :desc)
                   .page(params[:page])
                   .per(16)
    else
      @posts = Post.all.order(created_at: :desc)
                   .page(params[:page])
                   .per(16)
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    Rails.logger.debug "Buscando Post com id: #{params[:id]} - Resultado: #{@post.inspect}"

    return unless @post.nil?

    redirect_to posts_path, alert: 'Post não encontrado.' and return

    # Se @post existir, a view show.html.erb será renderizada normalmente
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: 'Post criado com sucesso!'
    else
      flash.now[:alert] = @post.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: 'Post atualizado com sucesso!'
    else
      flash.now[:alert] = @post.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: 'Post excluído com sucesso!'
  end

  private

  def post_params
    params.require(:post).permit(:imagem, :titulo, :subtitulo, :descricao, :link, :palavra_chave)
  end
end
