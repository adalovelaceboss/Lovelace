Rails.application.routes.draw do

  root to: 'homepages#index'
  stormpath_rails_routes

  get 'homepages/index'

  # get 'adies/index' => 'adies#index', as: 'adies'
  #
  # get 'adie/:id' => 'adies#show', as: 'adie'
  #
  # get 'adie/new' => 'adies#new', as: 'new_adie'
  #
  # post 'adie/create' => 'adies#create', as: 'create_adie'
  #
  # get 'adie/:id/edit' => 'adies#edit', as: 'edit_adie'
  #
  # patch 'adie/:id/update' => 'adies#update', as: 'update_adie'
  #
  # delete 'adie/:id/destroy' => 'adies#destroy', as: 'delete_adie'

  resources :adies

  # get 'employees/index' => 'employees#index', as: 'employees'
  #
  # get 'employees/show/:id' => 'employees#show', as: 'employee'
  #
  # get 'employees/new' => 'employees#new', as: 'new_employee'
  #
  # post 'employees/create' => 'employees#create', as: 'create_employee'
  #
  # get 'employees/:id/edit' => 'employees#edit', as: 'edit_employee'
  #
  # patch 'employees/:id/update' => 'employees#update', as: 'update_employee'
  #
  # delete 'employees/:id/destroy' => 'employees#destroy', as: 'delete_employee'

  resources :employees

  # get 'companies/index' => 'companies#index', as: 'companies'
  #
  # get 'companies/show/:id' => 'companies#show', as: 'company'
  #
  # get 'companies/new' => 'companies#new', as: 'new_company'
  #
  # post 'companies/create' => 'companies#create', as: 'create_company'
  #
  # get 'companies/:id/edit' => 'companies#edit', as: 'edit_company'
  #
  # patch 'companies/:id/update' => 'companies#update', as: 'update_company'
  #
  # delete 'companies/:id/destroy' => 'companies#destroy', as: 'delete_company'

  resources :companies

end
