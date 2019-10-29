Rails.application.routes.draw do
  resources :users
  get 'sessions/new'
   resources :sessions, only: [:new, :create, :destroy]
  resources :tasks
root to:  "tasks#index"
end
