Rails.application.routes.draw do
  root 'static_pages#home'
  resources :users
  resources :grampus_players, only: [:index, :show]
end
