Rails.application.routes.draw do
  
  devise_for :users
  get '/dashboard', to: 'users#show'
  get '/about', to: 'static_pages#about'
  
  root 'static_pages#index'
end
