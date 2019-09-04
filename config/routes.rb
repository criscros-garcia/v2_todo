Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users
  get 'welcome/index'
  root 'welcome#index'
  resources :lists do
  resources :tasks
  end

end
