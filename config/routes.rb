# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # CabsController
  get '/allcabs', to: 'cabs#all_cabs'
  post '/cabdetailsbylicence', to: 'cabs#cab_details_by_licence'
  post '/cablistgivenlocation', to: 'cabs#cab_list_given_location'

  # driversController
  get '/available_drivers', to: 'drivers#available_driver'
  get '/not_available_drivers', to: 'drivers#not_available_driver'
  post '/create_driver', to: 'drivers#create_driver'
  put '/update_driver/:id', to: 'drivers#update_driver'
  get '/cabdetailsbydriverid/:id', to: 'drivers#cab_details_by_driver_id'
  get '/get_order_details_by_driver_id/:id', to: 'drivers#get_order_details_by_driver_id'

  # transactionsController
  get '/last_day_earning_by_driver_id/:id', to: 'transaction#last_day_earning_by_driver_id'

  # riderController
  post '/price_calculator', to: 'rider#price_calculator'
end
