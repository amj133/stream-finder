Rails.application.routes.draw do
  root to: "welcome#index"

  resources :users, only: [:create, :show], param: :slug
  get "/register", to: "users#new"
end
