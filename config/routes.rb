Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :users

  resources :posts do
    resources :comments
  end
  
  resources :material_categories
  resources :materials
  resources :recipes
  resources :favorites, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end
