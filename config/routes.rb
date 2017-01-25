Rails.application.routes.draw do

  root to: 'homepages#index'
  stormpath_rails_routes

  get 'homepages/index'

  get 'admins/index'

  resources :adies

  resources :employees

  resources :companies

end
