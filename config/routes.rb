Rails.application.routes.draw do
  resources :tasks
root to:  "tasks#index"
resources :sessions, only: [:new, :create, :destroy]
  resources :users
end
