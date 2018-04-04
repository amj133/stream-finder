Rails.application.routes.draw do
  root to: "welcome#index"

  resources :users, only: [:create, :show], param: :slug
  get "/register", to: "users#new"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#delete"
  get "/auth/google", as: :google_login
  get "/auth/google/callback", to: "sessions#create"
end
