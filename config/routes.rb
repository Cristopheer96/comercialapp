Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  devise_for :user
  resources :categories
  resources :clients
  resources :suppliers
  get 'buscador_proveedor/:termino', to: 'suppliers#buscador' #ver controlador
  post 'add_sup_almacen/', to: 'warehouses#add_proveedor'

  resources :products
  resources :warehouse_records
  resources :sales
  get 'buscador_productos/:termino', to: 'products#buscador'

  get 'buscador_clientes/:termino',  to: 'clients#buscador'

  post 'add_item_venta', to: 'sales#add_item'
  post 'add_client_venta', to: 'sales#add_cliente'

  resources :warehouses
  post 'add_item_almacen', to: 'warehouses#add_item'
  get 'buscador_proveedores/:termino', to: 'suppliers#buscador'

  post 'add_proveedor_entrada', to: 'warehouses#add_proveedor'
  resources :profiles, only: [:show, :edit, :update]

  post '/search', to: 'search#results'
end
