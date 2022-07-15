Rails.application.routes.draw do
  devise_for :users
  root 'divisions#index'
  resources :divisions
  resources :employees do 
    resources :employees_projects
  end 
  resources :projects 
  resources :users
  resources :roles
end
