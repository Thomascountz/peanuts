Rails.application.routes.draw do

  devise_for :users
  get '/dashboard', to: 'users#dashboard'
  get '/about', to: 'static_pages#about'
  get '/coming_soon', to: 'static_pages#coming_soon'
  get '/demo', to: 'users#demo_sign_in'

  resources :events, only: [:new, :create, :edit, :update, :destroy]
  root 'static_pages#index'
end
