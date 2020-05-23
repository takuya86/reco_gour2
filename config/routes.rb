Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users
  resources :posts do
    resource :like, only: [:create, :destroy]
    resource :comments, only: [:create, :destroy]
  end
end
