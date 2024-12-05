Rails.application.routes.draw do
  # Admin Panel for Admin Users
  authenticate :user, lambda { |u| u.admin? } do
    mount Motor::Admin => '/motor_admin'
  end

  # Devise Authentication
  devise_for :users

  # Checkout Routes
  get 'checkout', to: 'checkouts#show'
  get 'checkout/success', to: 'checkouts#success'

  # Static Pages
  root to: 'pages#home'
  get 'terms-and-conditions', to: 'pages#terms'
  get 'privacy-policy', to: 'pages#privacy'
  get 'cookies', to: 'pages#cookies'

  # Widgets and Nested Stocks
  resources :widgets do
    get 'stocks', to: 'widgets#stock_portfolio'
    resources :stocks, only: :create
    member do
      get 'fitness'
      get 'habits'
      get "time"
    end
  end

  # Tasks
  resources :tasks

  # Top-level Stocks
  resources :stocks, only: :destroy
end
