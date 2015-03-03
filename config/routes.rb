Rails.application.routes.draw do
  resources :products
  resources :categories

  root to: "products#main"

  match '/about',   to: 'products#about',   via: 'get'
  match '/image',   to: 'products#image',   via: 'get'
  match '/contact',   to: 'products#contact',   via: 'get'
  match '/shop',   to: 'products#shop',   via: 'get'
  match '/prod',   to: 'statics#prod',   via: 'get'
end
