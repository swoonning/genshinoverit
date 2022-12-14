Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :characters, only: %i[index show sort recent hype]
  resources :elements, only: %i[index]
  resources :webhooks, only: %i[create]


  get '/sort', to: "characters#sort"
  get '/recent', to: "characters#recent"
  get '/hype', to: "characters#hype"
  get '/search', to: "characters#search"
  get '/cart', to: "characters#cart"
  post "checkout/create", to: "checkout#create"
  post "characters/add_to_cart/:id", to: "characters#add_to_cart", as: "add_to_cart"
  delete "characters/remove_from_cart/:id", to: "characters#remove_from_cart", as: "remove_from_cart"

  # Defines the root path route ("/")
  root "characters#index"


end
