Rails.application.routes.draw do
  devise_for :admins
  root to: 'home#index'
  get 'catalog', to: 'books#index'
  get 'settings/addresses', to: 'addresses#index'
  post 'settings/addresses', to: 'addresses#create'
  get 'settings/privacy', to: 'users#index'
  put 'settings/privacy', to: 'users#update'


  resources :books, only: %i[index show] do
    resources :reviews, only: :create
  end
  resources :carts, only: :show
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html




  resources :checkout
  resources :credit_card
  resources :orders, only: %i[index show]
  resources :order_items, only: %i[create update destroy]



  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
