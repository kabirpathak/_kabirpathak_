Rails.application.routes.draw do
  root 'blogs#index'

  resources :blogs
  namespace :api do
    namespace :v1 do
      resources :blogs
    end
  end

  resources :collections
  namespace :api do
    namespace :v1 do
      resources :collections
    end
  end

  get '/about', to: 'about#author'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
