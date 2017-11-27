Rails.application.routes.draw do
  resources :os_products
  resources :os_families
  resources :security_softwares
  resources :os
  resources :node_models
  resources :nodes
  resources :networks
  devise_for :users
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: "home#index"
end
