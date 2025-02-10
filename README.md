# Projeto Ruby  
Primeiro Projeto Ruby

# TurismoMs

TurismoMs é um aplicativo Ruby on Rails para gerenciamento de destinos turísticos. O sistema possibilita o cadastro e a exibição de posts (destinos), a busca por palavra-chave, a autenticação de usuários e funcionalidades de administração restritas (como a criação de posts e o gerenciamento de administradores).

## Funcionalidades

- **Cadastro de Destinos:** Crie, edite e exclua posts de destinos turísticos.
- **Busca por Palavra-chave:** Pesquise os destinos cadastrados e visualize os resultados em cards estilizados.
- **Autenticação:** Sistema de login para clientes e administradores.
- **Administração:** 
  - Usuários administradores têm acesso a funcionalidades extras, como a criação de posts e o cadastro de novos administradores.
  - Menu de opções na header para acessar funcionalidades (editar perfil, criar post, criar novo admin).
- **Interface Responsiva e Estilizada:** Layout com formulários e cards centralizados, utilizando CSS personalizado.

## Requisitos

- Sistema Operacional: Ubuntu
- Ruby (versão 3.0 ou superior recomendada)
- Rails (versão 6.x ou 7.x)
- Banco de dados (SQLite para desenvolvimento; PostgreSQL/MySQL para produção)
- Node.js e Yarn (para o gerenciamento dos assets)

## Instalação

1. **Instale tudo que for necessário para rodar o projeto:**

   - Ruby  
   - Ruby on Rails (seja no seu sistema Ubuntu ou em uma máquina virtual com Ubuntu)  
   - Então, clone o repositório na pasta de sua preferência:

     ```bash
     git clone https://github.com/FeliphRenaud/ProjetoRuby
     cd turismo_ms
     ```
     
   - Instale as dependências dentro da pasta do projeto.
   

2. **Das Dependências:**


   Para este projeto voce precisara trabalhar com algumas gems especificas:
    na gem file voce precisara habilitar ou inserir as seguintes gem`s:
     - gem 'bcrypt', '~> 3.1.7'
     - gem 'kaminari'
     - gem 'pg', '~> 1.1' (caso utilize o postgres como db)
   a seguir voce roda o comando:      
     - `bundle install`
   Verifique na gemfile.lock se existe referencia as gems instaladas.
   e seu ambiente estara pronto para rodas os comandos:      
   - `rails db:create` (no meu caso, utilizei o PostgreSQL)  
   - `rails db:migrate`  
   - Então, basta rodar `rails s` no terminal e acessar `localhost:3000`.

3. **Da Estrutura:**

   - **app/controllers:** Contém os controllers (PostsController, SessionsController, AdminsController, etc).
   - **app/models:** Contém os models (Cliente, Post, etc).
   - **app/views:** Contém as views e templates (layouts, formulários, páginas de listagem e de detalhe).
   - **app/assets:** Contém arquivos de CSS, JavaScript e imagens.
   - **config/routes.rb:** Define as rotas do aplicativo.

4. **Dos Testes:**

   - Para rodar os testes (caso existam):
     - `rails test` (no terminal)  
   - Ou, se estiver usando RSpec:
     - `bundle exec rspec` (também no terminal)

## Contribuição

Sinta-se à vontade para contribuir com o projeto! Faça um fork, crie uma branch para suas alterações e envie um pull request.

## Licença

Distribuído sob a [MIT License](LICENSE). Consulte o arquivo LICENSE para mais informações.
