Rails.application.routes.draw do

  #get 'password_resets/new'

  root 'sessions#index'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users
  resources :password_resets
end
