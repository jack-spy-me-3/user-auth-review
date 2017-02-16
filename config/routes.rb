Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #sign up routes
  root to: "users#index"
  get "/signup", to: "users#new"
  post "/users", to: "users#create"

  #logging in/out routes
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
end
