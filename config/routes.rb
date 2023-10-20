Rails.application.routes.draw do
  resources :customers, only: [:new, :create, :show, :update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "customers#new"

  resources :customers do
    resources :products, only: %i[new create]
  end
end
