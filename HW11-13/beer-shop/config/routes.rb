Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'products#index'

  get 'search', to: 'products#search'

  get 'search_by_price', to: 'products#search_by_price'

  resources :products do
    get :autocomplete_product_title, :on => :collection
  end
  resources :categories
end
