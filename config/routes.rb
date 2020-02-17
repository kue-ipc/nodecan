Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :security_softwares
  resources :node_models
  resources :nodes
  resources :networks
  devise_for :users
  scope '/os' do
    resources :os_families, path: 'families'
    resources :os_products, path: 'products'
  end
  resources :os_versions, path: 'os'
  scope '/admin' do
    resources :users
  end
end
