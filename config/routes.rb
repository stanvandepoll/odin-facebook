Rails.application.routes.draw do
  root to: 'users#new'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
