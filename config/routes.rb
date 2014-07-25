Rails.application.routes.draw do

  devise_for :users

  resources :site, only: [:index]
  root 'site#index'


  post '/current_location', to: 'locations#current_location'
  get '/search' => 'search#index'

  post 'truck/:id' => 'trucks#duplicate', as: :duplicate_truck

  resources :trucks do
    resources :locations
    resources :frequent_locations
  end
end
