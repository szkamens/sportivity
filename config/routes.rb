Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :activities
  get '/me', to: 'users#me', as: :me
  
  resources :users, only: :show
end
