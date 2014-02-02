Rails.application.routes.draw do
  devise_for :users
  resources :guests
  root 'assets#index'
end
