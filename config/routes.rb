Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  devise_for :user
  resources :categories
  resources :clients
  resources :suppliers
  resources :products
  resources :warehouse_records
  resources :sales
  get 'buscador_productos/:termino', to: 'products#buscador'

  get 'buscador_clientes/:termino', to: 'clients#buscador'

  post 'add_item_venta', to: 'sales#add_item'
  post 'add_client_venta', to: 'sales#add_cliente'

end
