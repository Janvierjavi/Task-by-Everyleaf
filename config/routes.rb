Rails.application.routes.draw do
  get 'sessions/new'
  resources :users
   resources :sessions, only: [:new, :create, :destroy]
  resources :tasks
root to:  "tasks#index"
end
