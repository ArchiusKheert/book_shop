Rails.application.routes.draw do


  resources :books do
    resources :reviews, only: [:create, :destroy]
  end
  resources :orders
  resources :order_items, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  get 'catalog', to: 'books#index'
  get 'cart', to: 'cart#show'


  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
