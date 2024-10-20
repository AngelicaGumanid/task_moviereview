Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :movies do
    resources :reviews, only: [:create]
  end

  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
end
