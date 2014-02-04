Rails.application.routes.draw do
  resources :guests
  resources :sessions
  resources :users

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"

  root 'assets#index'
end
