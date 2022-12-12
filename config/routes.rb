Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :characters, only: %i[index show sort recent hype]
  resources :elements, only: %i[index]


  get '/sort', to: "characters#sort"
  get '/recent', to: "characters#recent"
  get '/hype', to: "characters#hype"
  get '/search', to: "characters#search"
  post "checkout/create", to: "checkout#create"

  # Defines the root path route ("/")
  root "characters#index"
end
