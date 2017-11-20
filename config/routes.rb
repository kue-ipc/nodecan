Rails.application.routes.draw do
  resources :security_softwares
  resources :os
  resources :node_models
  resources :os_types
  resources :ip_settings
  resources :nodes
  resources :networks
  resources :dhcp_types
  resources :nic_types
  devise_for :users
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: "home#index"
end
