Rails.application.routes.draw do
  resources :labels
  get 'sessions/new'
  resources :users
  namespace :admin do
    resources :users
  end
   resources :sessions, only: [:new, :create, :destroy]
  resources :tasks
root to:  "sessions#new"
end
