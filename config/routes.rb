Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :movies do
    resources :reviews, only: [:create, :edit, :update, :destroy]
  end

  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  get 'movies/s/:short_url', to: 'movies#redirect_short_url', as: :short_movie

end
