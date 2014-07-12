Rails.application.routes.draw do

  devise_for :users

  root 'site#index'

  resources :trucks do
    resources :locations
  end
end
