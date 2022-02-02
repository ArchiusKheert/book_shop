Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  use_doorkeeper

  root to: 'home#index'
  get 'catalog', to: 'books#index'
  get 'settings/addresses', to: 'addresses#index'
  post 'settings/addresses', to: 'addresses#create'
  put 'settings/addresses', to: 'addresses#update'
  get 'settings/privacy', to: 'users#edit'

  resources :users, only: %i[edit] do
    collection do
      patch 'update_email'
      patch 'update_password'
    end
  end


  resources :books, only: %i[index show update] do
    resources :reviews, only: :create
  end
  resources :carts, only: :show
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html




  resources :checkout
  resources :credit_card
  resources :orders, only: %i[index show]
  resources :order_items, only: %i[create update destroy]


  devise_for :admins
  devise_for :users,
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
