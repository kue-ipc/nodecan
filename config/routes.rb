Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :os_versions
  resources :os_products
  resources :os_families
  resources :security_softwares
  resources :node_models
  resources :nodes
  resources :networks
  devise_for :users
end
