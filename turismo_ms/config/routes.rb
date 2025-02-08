Rails.application.routes.draw do
  get 'clientes/new'
  get 'clientes/create'
  root 'home#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'posts/index'
  get 'posts/show'
  get 'posts/new'
  get 'posts/create'
  get 'posts/edit'
  get 'posts/update'
  get 'posts/destroy'

  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  resources :posts
  resources :clientes, only: %i[new create edit update]
  resources :admins, only: [:new, :create]

end
