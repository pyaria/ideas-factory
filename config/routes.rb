Rails.application.routes.draw do
  root 'ideas#index'
  resources :ideas, only: [:index, :new, :create]
  resources :users, only: [:new, :create]
end
