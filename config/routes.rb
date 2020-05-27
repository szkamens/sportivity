Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
<<<<<<< HEAD

  get 'dashboard', to: 'pages#dashboard', as: :dashboard

  resources :activities, only: %i[index new create show]
=======
  
  resources :activities, only: [:index, :new, :create, :show, :destroy]
>>>>>>> 3c6c770230a9992ca6d5d8b60915d6fa4f5fee07

end
