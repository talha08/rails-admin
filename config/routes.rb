Rails.application.routes.draw do

  #get 'password_resets/new'

  root 'cuisines#index'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users
  resources :cuisines, only: [:index, :show]
  resources :recipes, only: [:show, :edit, :update, :destroy]
  resources :password_resets
end
