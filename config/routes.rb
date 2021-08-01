Rails.application.routes.draw do
  resources :categories
  resources :authors
  resources :books do
    resources :reviews
    resources :order_items
  end
  resources :orders do
    resources :order_items
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  get 'catalog', to: 'books#index'
  get 'cart', to: 'cart#show'


  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
