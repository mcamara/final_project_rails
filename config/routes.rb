Rails.application.routes.draw do
  get 'users' => 'users#index'
  get 'friendships/create'
  get 'friendships/update'
  get 'friendships/destroy'
  get 'profile' => 'profile#index'
  patch 'profile' => 'profile#update'

  devise_for :users

  root 'home#index'

  resources :users, only: [:show]

  resources :photos do
    resources :comments
  end

  resources :friendships, only: [:create, :update, :destroy]
end
