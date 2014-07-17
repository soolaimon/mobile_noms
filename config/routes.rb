Rails.application.routes.draw do

  devise_for :users

  root 'site#index'

  post '/current_location', to: 'locations#current_location'
  get '/search' => 'search_results#index'


  resources :trucks do
    resources :locations
  end
end
