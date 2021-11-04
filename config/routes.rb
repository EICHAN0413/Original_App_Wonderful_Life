Rails.application.routes.draw do

  get 'recipes/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root 'top#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
  end


  resources :users

  resources :posts do
    collection do
      get :recipe
      get :search
      get :scope
    end
    resources :comments
  end
  
  resources :material_categories
  resources :materials
  resources :recipes
  resources :favorites, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]





end