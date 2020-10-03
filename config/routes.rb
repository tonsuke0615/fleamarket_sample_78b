Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :new, :create] do
    collection do
      get :search
    end
  end
  resources :orders
end
