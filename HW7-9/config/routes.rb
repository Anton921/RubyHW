Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index'

  post 'posts/:id', to: 'posts#show'

  get 'search', to: 'posts#search'

  post 'authorcommentvotes', to: 'authorcommentvotes#like_dislike'

  resources :posts do
    resources :comments
  end
  
  resources :sessions
  resources :authors
end
