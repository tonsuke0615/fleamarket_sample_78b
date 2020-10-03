Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :new, :create, :search]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :orders

  resources :items do
    collection do
      get :search
    end
  end

end
