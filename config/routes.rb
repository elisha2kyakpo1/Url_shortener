Rails.application.routes.draw do
  get 'urls/index'
  get 'urls/new'
  get 'users/new'
  get 'users/edit'
  get 'users/show'
  devise_for :users

  resources :users, only: [:index, :new, :create, :show]
   resources :urls, only: [:index, :new, :create, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'urls#index'
end
