# README
# Cab_system
      * Ruby version: 3.0.0
      
      * Configuration
      
      * Database creation:
         Rails new project_name –api –database=postgresql (For New Creation with PostgreSQL DB)
         sudo -i -u postgres
      
        
         CREATE DATABASE database_name;
        
        In default in ruby database.yml
           adapter: postgresql
           encoding: unicode
           host: localhost
           port: 5432
           user: 'postgres'
           password: '1234' (I added my localDB pass)
      
      * Database initialization
           Database name: cab_system_development

# Models: </br>
      1.Booking
      2.Cab 
      3.Driver 
      4.Location 
      5.Rider 
      6.Transaction


Routes </br>
CabsController

        # CabsController
         get "/allcabs", to: "cabs#all_cabs"
         post "/cabdetailsbylicence", to: "cabs#cab_details_by_licence"
         post "/cablistgivenlocation", to: "cabs#cab_list_given_location"

DriverController

      #driversController
        get "/available_drivers", to: "drivers#available_driver" 
        get "/not_available_drivers", to: "drivers#not_available_driver" 
        post "/create_driver", to: "drivers#create_driver"
        put "/update_driver/:id", to: "drivers#update_driver" 
        get "/cabdetailsbydriverid/:id", to: "drivers#cab_details_by_driver_id" 
        get "/get_order_details_by_driver_id/:id", to: "drivers#get_order_details_by_driver_id" 
        
TransactionsController

      #transactionsController
        get "/last_day_earning_by_driver_id/:id", to: "transaction#last_day_earning_by_driver_id" 

RiderController

     post '/price_calculator', to: 'rider#price_calculator' 

PlaceController
     
     post '/create_place', to: 'place#create_place' 

UserController
       
       post '/create_user', to: 'user#create_user'
       post '/login', to: 'user#login' 
       get '/logout', to: 'user#logout' 


<h1> All URL Documentation as Localhost(After installing all the routes will be indicate) </h1>
      https://documenter.getpostman.com/view/9556363/2s9YC8uqZ9 



<h1>API Outcome: </h1>
<div>
   <h1> Screenshots </h1>

   <img src="https://github.com/kaushikpuka1998/Cab_system/assets/52675676/cd887483-0eb0-4785-8d2c-6558f656d601" width="100%" height="50%" />
   <img src="https://github.com/kaushikpuka1998/Cab_system/assets/52675676/ef760553-8dd4-4c45-a33d-d428d9c7fb14" width="100%" height="50%" />
   <img src="https://github.com/kaushikpuka1998/Cab_system/assets/52675676/63d1730d-898c-4825-89f5-9a9e6cf62000" width="100%" height="50%" />

   <div>
      <h1>Driver Details with Location </h1> </br>
      <img src="https://github.com/kaushikpuka1998/Cab_system/assets/52675676/7e7a29a5-5325-46dd-a1e4-4d439ec3732a" width="100%" height="50%" />
   </div>

   <div>   
       <h1> Cab details of given, location inside 50 km Circle </h1>
      <img src="https://github.com/kaushikpuka1998/Cab_system/assets/52675676/24df237c-29e7-430b-8373-8c7d8d9f653b" width="100%" height="50%" />
   </div>


   <div> 
      <h1>After Custom Middleware Implementation </h1>
      <img src="https://github.com/kaushikpuka1998/Cab_system/assets/52675676/ce9f90aa-182d-4e99-9737-6125bc590e97" width="100%" height="50%" />
      <img src="https://github.com/kaushikpuka1998/Cab_system/assets/52675676/429f5977-c2a3-449a-8bac-6f1a045f46bf" width="100%" height="50%" />
   </div>


   <div> 
      <h1>Login/Logout/SignUp </h1>
      <img src="https://github.com/kaushikpuka1998/Cab_system/assets/52675676/2266d78e-cb27-4ea0-9da7-2945dcf97f7a" width="100%" height="50%" />
      <img src="https://github.com/kaushikpuka1998/Cab_system/assets/52675676/e325c149-b18e-462d-9751-9d56cfa242d7" width="100%" height="50%" />
      <img src="https://github.com/kaushikpuka1998/Cab_system/assets/52675676/2b988070-7f7b-47b8-96d0-2bec36e3a4ec" width="100%" height="50%" />
      <img src="https://github.com/kaushikpuka1998/Cab_system/assets/52675676/c025cf2a-f4e0-4711-8e8e-e16607a031c0" width="100%" height="50%" />
   </div>

</div>





