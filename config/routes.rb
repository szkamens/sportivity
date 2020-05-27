Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :activities, only: [:new, :create, :show]
end
