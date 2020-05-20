Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'profiles', to: 'users/registrations#new_profiles'
    post 'profiles', to: 'users/registrations#create_profiles'
  end
  
  root 'items#index'
  resources :credit_cards, only:[:new]
  resources :mypage, only:[:new]
  resources :address, only:[:new]
  resources :inquiry, only:[:new]
  resources :logout, only:[:new]
  resources :mail_password, only:[:new]
  resources :profile, only:[:new]
  resources :user_info, only:[:new]

  resources :items, only:[:index, :new, :show, :destroy] do
    resources :image

    resources :buys, only: [:show]
    end
  end

