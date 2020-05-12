Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  root to: "home#index"
  resources :items, only: [:index, :show]
end
