Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources :lists do
  resources :tasks
  end
  root 'welcome#index'
  
end
