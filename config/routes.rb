Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :characters, only: %i[index show sort]
  resources :elements, only: %i[index]

  get '/sort', to: "characters#sort"

  # Defines the root path route ("/")
  root "characters#index"
end
