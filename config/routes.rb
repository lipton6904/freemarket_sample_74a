Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :credit_cards, only:[:new]
  resources :items do
    resources :image
    resources :buys, only: [:show]
  end
  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    member do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
end
