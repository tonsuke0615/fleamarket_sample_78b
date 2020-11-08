Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get 'profiles', to: 'users/registrations#new_profile'
    post 'profiles', to: 'users/registrations#create_profile'
    get 'destinations', to: 'users/registrations#new_destination'
    post 'destinations', to: 'users/registrations#create_destination'
  end
  root 'items#index'
  resources :items do
    collection do
      get :search
      get :get_category_children , defaults: { fomat: 'json'}
      get :get_category_grandchildren , defaults: { fomat: 'json'}
    end
  end
  resources :orders

  get 'mypage/index', to: 'mypages#index'
  get 'mypage/logout', to: 'mypages#logout'
  get 'mypage/creditcard', to: 'mypages#creditcard'

  resources :cards, only: [:new, :show, :destroy] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
    end
  end
  resources :items do
    resources :purchase, only: [:index] do
      collection do
        post 'pay', to: 'purchase#pay'
        get 'done', to: 'purchase#done'
      end
    end
  end
end
