Rails.application.routes.draw do
  resources :items
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  root to: "main#index"

  get "about", to: "about#index"

  get "/", to:"main#index"

  get "password", to:"passwords#edit", as: :edit_password
  patch "password", to:"passwords#update"

  get "sign-up", to:"registrations#new"
  post "sign-up", to:"registrations#create"

  get "login", to:"sessions#new"
  post "login", to:"sessions#create"

  delete "logout", to:"sessions#destroy"

  get "active",  to: "sessions#active"
  get "timeout", to: "sessions#timeout"
end
