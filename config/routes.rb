Rails.application.routes.draw do

  root 'bio#index'

  resources :bio, only: [:index]
  resources :live_clients, :path => 'live', only: [:index]

  resources :studio_clients, :path => 'studio', only: [:index] do
    resources :tracks, only: [:index]
  end

  namespace :admin do
    root 'bio#index', layout: 'admin'
    resources :bio, only: [:index], layout: 'admin'
    resources :live_clients, :path => 'live'
    resources :studio_clients, :path => 'studio' do
      resources :tracks
    end
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # DELETE THIS SHIT ONCE ALICE IS SIGNED UP
  # get '/signup' => 'users#new'
  # post '/users' => 'users#create'
  # DELETE THIS SHIT ONCE ALICE IS SIGNED UP
end
