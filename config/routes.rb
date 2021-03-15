Rails.application.routes.draw do
  root 'static_pages#home'
  get "static_pages/temporary" => "static_pages#temporary"
  resources :users
end
