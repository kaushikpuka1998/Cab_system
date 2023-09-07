require 'json'

class DriversController < ApplicationController
  
  
  def available_driver
    drivers = Driver.all
    render json: drivers
  end


  def not_available_driver
    drivers = Driver.available.invert_where
    render json: drivers
  end

  def create_driver
    driver = Driver.new(driver_params)
    if driver.save
      render json: driver
    else
      render json: driver.errors
    end
  end


  def update_driver
    driver = Driver.find(params[:id])
    if driver.update(driver_params)
      render json: driver
    else  
      render json: driver.errors
    end
  end


  def get_order_details_by_driver_id
    driver = Driver.find(params[:id])
    render json: driver.bookings
  end

  def cab_details_by_driver_id
    driver = Driver.find(params[:id])
    render json: driver.cab
  end



  private

  def driver_params
    params.require(:driver).permit(:name, :phone, :availability, :licence)
  end
  
end