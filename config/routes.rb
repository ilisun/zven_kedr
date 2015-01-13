Rails.application.routes.draw do
  resources :product

  root to: "product#index"

  match '/about',   to: 'product#about',   via: 'get'
  match '/contact',   to: 'product#contact',   via: 'get'
  match '/shop',   to: 'product#shop',   via: 'get'
  match '/single-product',   to: 'product#single-product',   via: 'get'
end
