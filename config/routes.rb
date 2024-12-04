Rails.application.routes.draw do
  authenticate :user, lambda { |u| u.admin? } do
    mount Motor::Admin => '/motor_admin'
  end

  devise_for :users
  get 'checkout', to: 'checkouts#show'
  get 'checkout/success', to: 'checkouts#success'
  root to: 'pages#home'
  get 'terms-and-conditions', to: 'pages#terms'
  get 'privacy-policy', to: 'pages#privacy'
  get 'cookies', to: 'pages#cookies'

  resources :widgets do
     get 'stocks', to: 'widgets#stock_portfolio'
  end
  resources :tasks


end
