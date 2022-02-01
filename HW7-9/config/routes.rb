Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index'

  post 'posts/:id', to: 'posts#show'

  get 'search', to: 'posts#search'

  resources :posts do
    resources :comments do
      post 'like', to: 'authorcommentvotes#like'
      post 'dislike', to: 'authorcommentvotes#dislike'
      resources :authorcommentvotes
    end
  end
  
  resources :sessions
  resources :authors
end
