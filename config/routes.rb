Rails.application.routes.draw do
  devise_for :users
  # devise_for :users, :skip => :registrations
  resources :products
  resources :categories

  root to: "products#main"

  match '/about',   to: 'statics#about',   via: 'get'
  match '/image',   to: 'products#image',   via: 'get'
  match '/contact',   to: 'statics#contact',   via: 'get'
  match '/shop',   to: 'products#shop',   via: 'get'
  match '/prod',   to: 'statics#prod',   via: 'get'
end
