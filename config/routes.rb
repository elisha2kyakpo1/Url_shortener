Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[index new create show]
  resources :urls, only: %i[index new create]
  get '/url/:short_url', to: 'urls#clicks', as: 'url_clicked'
  get '/most_clicked', to: 'urls#most_clicked_link', as: 'most_clicked'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'urls#index'
end
