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

  resources :items do
    resources :image
  

    resources :items   do
      resources :buys do
        collection do
          post 'pay', to: 'buys#pay'
        end
      end
    end

  resources :buys, only: [:show]
  end

  resources :credit_cards, only: [:new, :create, :show, :destroy] do
  end

end

