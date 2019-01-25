Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index' #profile page when logged in
  resources :users do
    member do
      get :friendships, :incoming_requests
    end
  end
  resources :friend_requests, only: [:create, :destroy]
  resources :friendships
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
