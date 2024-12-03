Rails.application.routes.draw do
  authenticate :user, lambda { |u| u.admin? } do
    mount Motor::Admin => '/motor_admin'
    #root to: "user_widgets#"
  end

  devise_for :users
  get 'checkout', to: 'checkouts#show'
  get 'checkout/success', to: 'checkouts#success'
  root to: 'pages#home'
  get 'terms-and-conditions', to: 'pages#terms'
  get 'privacy-policy', to: 'pages#privacy'
  get 'cookies', to: 'pages#cookies'

resources :user_widgets
resources :tasks

end
