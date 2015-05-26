Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, :skip => :registrations
  resources :products
  resources :categories
  resources :statics

  resources :articles do
    collection do
      get 'main'
    end
  end

  root to: 'products#main'

  match '/image',   to: 'products#image',   via: 'get'
  match '/shop',    to: 'products#shop',    via: 'get'
  match '/about',   to: 'statics#about',    via: 'get'
  match '/contact', to: 'statics#contact',  via: 'get'
  match '/prod',    to: 'statics#prod',     via: 'get'
  match '/order',   to: 'statics#order',    via: 'get'

  match '/send_contact_email',  to: 'statics#send_contact_email',   via: :post
  match '/send_order_email',    to: 'statics#send_order_email',     via: :post

end
