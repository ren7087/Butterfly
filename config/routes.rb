Rails.application.routes.draw do
  devise_for :users,
   controllers: { 
    registrations: 'registrations',
    sessions: :sessions
   }
  root 'toppages#index'
  
  get '/posts/new', to: 'posts#new'
  post '/posts', to: 'posts#create'
  
  resources :users, only: [:show, :index]
end