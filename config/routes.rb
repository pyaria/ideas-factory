Rails.application.routes.draw do
  root 'ideas#index'
  resources :ideas, only: [:index, :new, :create, :show]
  resources :ideas, only: :show do
    resources :comments, only: [:new, :create]
    resources :joins, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

end
