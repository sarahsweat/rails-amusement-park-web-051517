Rails.application.routes.draw do

  root 'welcome#index'

  get 'users/new', to: 'users#new', as: 'signup'
  post '/signin', to: 'sessions#create', as: 'signin'
  get '/signin', to:'sessions#new', as: 'login_page'

  delete '/sessions/:id', to: 'sessions#destroy', as: 'logout'



  resources :sessions

  resources :users

  resources :attractions do
      member do
        post 'ride'
      end
    end

end
