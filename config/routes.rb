Rails.application.routes.draw do
  get 'users/index'
  # get 'users/show'
  devise_for :users
  resources :books
  resources :users
  root 'users#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
