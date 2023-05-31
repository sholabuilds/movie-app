Rails.application.routes.draw do
  root "movies#index"

  # nested resource enforces parent-child relationship
  resources :movies do
    resources :reviews
  end
end
