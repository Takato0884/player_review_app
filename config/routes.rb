Rails.application.routes.draw do
  root 'static_pages#home'
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users
  resources :grampus_players, only: [:index, :show]
  resources :games, only: [:index, :show]
end
