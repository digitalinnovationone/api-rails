Rails.application.routes.draw do
  post "/administradores/login", to: "administradores#login"

  resources :administradores
  resources :funcionarios
  
  root "home#index"

  get "/clientes", to: "clientes#index"
  get "/clientes/:id", to: "clientes#show"
  post "/clientes", to: "clientes#create"
  delete "/clientes/:id", to: "clientes#destroy"
  match '/clientes/:id', to: 'clientes#update', via: [:patch, :put]
end
