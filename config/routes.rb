Rails.application.routes.draw do

  devise_for :users
  get '/dashboard', to: 'users#dashboard'
  get '/about', to: 'static_pages#about'
  get '/coming_soon', to: 'static_pages#coming_soon'
  get '/demo', to: 'users#demo_sign_in'

  resources :events, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :event_times, only: [:show, :new, :create, :edit, :update, :destroy]
  end

  resources :tickets, only: [:create]

  root 'static_pages#index'
end
