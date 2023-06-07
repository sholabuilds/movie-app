Rails.application.routes.draw do
  root "movies#index"
  
  # nested resource enforces parent-child relationship
  resources :movies do
    resources :reviews
  end

  resources :users
  get "signup", to: "users#new"

  resource :session, only: [:new, :create, :destroy]
  get "signin", to: "sessions#new"
end
