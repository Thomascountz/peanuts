Rails.application.routes.draw do

  devise_for :users
  get '/dashboard', to: 'users#dashboard'
  get '/about', to: 'static_pages#about'
  get '/comingsoon', to: 'static_pages#coming_soon'

  root 'static_pages#index'
end
