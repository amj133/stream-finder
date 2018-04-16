Rails.application.routes.draw do
  root to: "welcome#index"

  resources :users, only: [:create, :show], param: :slug
  resources :projects, only: [:show, :new, :create, :destroy, :edit, :update], param: :slug
  resources :favorite_stations, only: [:destroy]

  get "/register", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#delete"
  get "/auth/google", as: :google_login
  get "/auth/google/callback", to: "sessions#create"

  resources :stations, only: [:index, :show]

  resources :search, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :stations, only: [:index]
      resources :streamflow, only: [:index]
      resources :projects, only: [:create]
    end
  end
end
