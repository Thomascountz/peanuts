Rails.application.routes.draw do
  
  devise_for :users
  resources :users, :only => [:show]
  
  get '/about', to: 'static_pages#about'
  
  root 'static_pages#index'
end
