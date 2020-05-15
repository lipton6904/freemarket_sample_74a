Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :credit_cards, only:[:new]
  resources :items do
    resources :image
    resources :buys, only: [:show]
  end
end
