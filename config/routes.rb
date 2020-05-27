Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :activities, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/activities/:id', to: 'activities#show'
end
