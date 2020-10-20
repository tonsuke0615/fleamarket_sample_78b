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
    # get 'login', to: 'devise/sessions#new'
    # post 'login', to: 'devise/sessions#create'
  end
  root to: 'items#index'
  resources :items, only: [:index, :new, :create, :show] do
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