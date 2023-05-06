Rails.application.routes.draw do
  root 'blogs#index'

  resources :blogs
  resources :collections

  get '/about', to: 'about#author'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
