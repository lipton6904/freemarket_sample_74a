Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :credit_cards, only:[:new]
  resources :items, only: [:index, :new, :show] do
    resources :buys, only: [:show]
  end
end
