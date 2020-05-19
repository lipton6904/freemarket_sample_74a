Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :credit_cards, only:[:new]
  resources :items do
    collection do
      get 'category_children' 
      get 'category_grandchildren'
    end
    resources :image
    resources :buys, only: [:show]
  end
end
