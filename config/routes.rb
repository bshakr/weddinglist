Rails.application.routes.draw do
  resources :guests
  root 'assets#index'
end
