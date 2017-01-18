Rails.application.routes.draw do

  root to: 'homepages#index'
  stormpath_rails_routes

  get 'homepages/index'

  resources :adies

  get 'adies' => 'adies#search'

  resources :employees

  resources :companies

end
