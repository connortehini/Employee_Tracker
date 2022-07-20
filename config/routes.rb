Rails.application.routes.draw do
  devise_for :users
  root 'divisions#index'
  resources :divisions
  resources :users do 
    resources :projects_users
  end 
  resources :projects 
  resources :roles
end
