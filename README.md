# README
# Cab_system
Things you may want to cover:

* Ruby version: 3.0.0

* Configuration

* Database creation:
   Rails new project_name –api –database=postgresql
  sudo -i -u postgres

  
  CREATE DATABASE database_name;
  
  In default in ruby database.yml
  
  
  adapter: postgresql
  encoding: unicode
  host: localhost
  port: 5432
  user: 'postgres'
  password: '1234'

* Database initialization
  Database name: cab_system_development

Models: </br>
1.Booking </br>
2.Cab </br>
3.Driver </br>
4.Location </br>
5.Rider </br>
6.Transaction </br>


Routes </br>
#CabsController
        get "/allcabs", to: "cabs#all_cabs" </br>
        post "/cabdetailsbylicence", to: "cabs#cab_details_by_licence" </br>
        post "/cablistgivenlocation", to: "cabs#cab_list_given_location" </br>
  


#driversController
        get "/available_drivers", to: "drivers#available_driver" </br>
        get "/not_available_drivers", to: "drivers#not_available_driver" </br>
        post "/create_driver", to: "drivers#create_driver"</br>
        put "/update_driver/:id", to: "drivers#update_driver" </br>
        get "/cabdetailsbydriverid/:id", to: "drivers#cab_details_by_driver_id" </br>
        get "/get_order_details_by_driver_id/:id", to: "drivers#get_order_details_by_driver_id" </br>

#transactionsController
      get "/last_day_earning_by_driver_id/:id", to: "transaction#last_day_earning_by_driver_id" </br>

All URL Documentation as Localhost: https://documenter.getpostman.com/view/9556363/2s9YC8uqZ9 

API Outcome:
Screenshots:

<img src="https://github.com/kaushikpuka1998/Cab_system/assets/52675676/cd887483-0eb0-4785-8d2c-6558f656d601" width="75%" height="50%" />
<img src="https://github.com/kaushikpuka1998/Cab_system/assets/52675676/ef760553-8dd4-4c45-a33d-d428d9c7fb14" width="75%" height="50%" />
<img src="https://github.com/kaushikpuka1998/Cab_system/assets/52675676/63d1730d-898c-4825-89f5-9a9e6cf62000" width="75%" height="50%" />

Driver Details with Location: </br>
<img src="https://github.com/kaushikpuka1998/Cab_system/assets/52675676/7e7a29a5-5325-46dd-a1e4-4d439ec3732a" width="75%" height="50%" />

Cab details of given
 location inside 50 km Circle
<img src="https://github.com/kaushikpuka1998/Cab_system/assets/52675676/24df237c-29e7-430b-8373-8c7d8d9f653b" width="75%" height="50%" />


After Custom Middleware Implementation:
<img src="https://github.com/kaushikpuka1998/Cab_system/assets/52675676/ce9f90aa-182d-4e99-9737-6125bc590e97" width="75%" height="50%" />
<img src="https://github.com/kaushikpuka1998/Cab_system/assets/52675676/429f5977-c2a3-449a-8bac-6f1a045f46bf" width="75%" height="50%" />



