Rails.application.routes.draw do
 devise_for :users
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions',
  #   registrations: 'users/registrations',
  #   # omniauth_callbacks: 'omni_auth'
  # }

  root to: 'pages#home'

  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_up', to: 'users/registrations#new'
    get 'forgot_password', to: 'users/passwords#new'
    get 'reset_password', to: 'users/passwords#edit'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :equipment do
    resources :reservations, only: [:new, :create]
  end
  resources :reservations, only: [:show, :edit, :update, :destroy]
  post 'reservations/:id/accept', to: 'reservations#accept', as: 
  :accept_reservation
  post 'reservations/:id/cancel', to: 'reservations#cancel', as: :cancel_reservation
  post 'reservations/:id/reject', to: 'reservations#reject', as: :reject_reservation

  # get 'profiles', to: 'profiles#show', as: "profiles"
  get 'profile', to: 'profiles#my'
  get 'profile/:id', to: 'profiles#show'

  get 'home', to: 'page#home'
end
