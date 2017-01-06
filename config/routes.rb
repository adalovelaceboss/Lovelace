Rails.application.routes.draw do

  root to: 'homepages#index'
  stormpath_rails_routes

  get 'homepages/index'

  resources :adies

  patch 'adies' => 'adies#upload'

  resources :employees

  resources :companies

end
