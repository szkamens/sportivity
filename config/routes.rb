Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :activities, only: %i[index new create]

  get '/activities/:id', to: 'activities#show'
end
