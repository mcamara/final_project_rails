Rails.application.routes.draw do
  get 'users' => 'users#index'
  get 'profile' => 'profile#index'
  patch 'profile' => 'profile#update'

  devise_for :users

  root 'home#index'

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :photos do
    resources :comments
  end

  resources :relationships, only: [:create, :destroy]
end
