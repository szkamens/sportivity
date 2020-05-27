Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :activities, only: [:index, :new, :create, :show, :destroy, :edit, :update]

end
