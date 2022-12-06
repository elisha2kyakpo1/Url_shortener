Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[index new create show]
  resources :urls, only: %i[index new create show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'urls#index'
end
