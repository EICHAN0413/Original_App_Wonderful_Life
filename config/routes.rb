Rails.application.routes.draw do
  resources :posts
  resources :material_categories
  resources :material
  resources :recipes
end
