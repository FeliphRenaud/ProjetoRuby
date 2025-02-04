class PostsController < ApplicationController
  #invoca o metodo require_admin antes de executar o CRUD
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]
  private

  def require_admin
    # Se o cliente nao estiver logado ou nao for um admin , acesso bloqueado.
    unless current_cliente && current_cliente.admin?
      render json: { error: "Acesso negado. Somente administradores podem realizar essa ação." }, status: :unauthorized
    end
  end


  def index
    @posts = Post.all
    render json: @posts
  end

 
  def show
    @post = Post.find(params[:id])
    render json: @post
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: { message: "Post criado com sucesso!", post: @post }, status: :ok
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      render json: { message: "Post atualizado com sucesso!", post: @post }, status: :ok
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    render json: { message: "Post excluído com sucesso!" }, status: :ok
  end

  private

  def post_params
    params.require(:post).permit(:imagem, :titulo, :subtitulo, :descricao, :link, :palavra_chave)
  end
end
