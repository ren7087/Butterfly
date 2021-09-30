Rails.application.routes.draw do
  devise_for :users,
   controllers: { 
    registrations: 'registrations',
    sessions: :sessions
   }
   
  root 'toppages#index'
  
  get '/posts/new', to: 'posts#new'
  post '/posts', to: 'posts#create'
  
  resources :users do
    member do
      get :likes
    end
  end
  
  resources :users do
    member do
      get :liked
    end
  end
  
  
  
  resources :users, only: [:show, :index]
  resources :reactions, only: [:create]
  resources :matching, only: [:index]
  resources :rooms, only: [:show]
end