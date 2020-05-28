Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  
  get 'dashboard', to: 'pages#dashboard', as: :dashboard

  resources :activities
  
  get 'users/:id', to: 'users#me', as: :me
  resources :users, only: :show
end
