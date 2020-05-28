Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'dashboard', to: 'pages#dashboard', as: :dashboard

  resources :activities, only: %i[index new create show]

  resources :activities, only: [:index, :new, :create, :show, :destroy]
end
