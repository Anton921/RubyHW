Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'products#index'

  get 'search', to: 'products#search'

  get 'search_by_price', to: 'products#search_by_price'

  resources :products do
    get :autocomplete_product_title, :on => :collection
    resources :order_items
    resources :comments
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do  
   get '/users/sign_out', to: 'devise/sessions#destroy'     
  end

  resources :categories

  resources :comments

  resources :orders

  get 'orders/:id/', to: 'products#index'
end
