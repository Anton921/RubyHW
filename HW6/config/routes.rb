Rails.application.routes.draw do
  root 'cv#index'

  get 'about' => 'french_b2#frb2'
end
