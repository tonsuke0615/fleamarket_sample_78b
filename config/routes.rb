Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :new, :create] do
    collection do
      get :search
    end
  end
  resources :orders
  get 'mypage/index', to: 'mypages#index'
  get 'mypage/logout', to: 'mypages#logout'
  get 'mypage/creditcard', to: 'mypages#creditcard'
  get 'mypage/add-creditcard', to: 'mypages#add-creditcard'
end