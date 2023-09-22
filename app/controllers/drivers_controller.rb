# frozen_string_literal: true

require 'json'

# This class manages the actions related to drivers
class DriversController < ApplicationController
  def available_driver
    # drivers = Driver.all

    # fresh_when drivers

    cache_key = "drivers_index/#{Driver.maximum(:updated_at).to_i}"

    # Try to read the cached data
    @drivers = Rails.cache.fetch(cache_key) do
      # If the cached data is not available or is outdated, fetch the data from the server
      Driver.available
    end

    # Compare the timestamp of the cached data with the timestamp of the data from the server
    if @drivers.maximum(:updated_at).to_i > cache_key.split('/').last.to_i
      # If the data from the server is newer than the cached data, expire the cache and fetch the data from the server
      Rails.cache.delete(cache_key)
      @drivers = Driver.available
    end

    # Set the cache expiration time
    expires_in 10.minutes, public: true
    render json: @drivers
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
    driver = Driver.find_by(id: params[:id])
    if driver.update(driver_params)
      render json: driver
    else
      render json: driver.errors
    end
  end

  def order_details_by_driver_id
    driver = Driver.find_by(id: params[:id])
    if driver.nil?
      render json: { 'result' => 'No bookings found' }
    else
      render json: driver.bookings
    end
  end

  def cab_details_by_driver_id
    driver = Driver.find_by(id: params[:id])
    if driver.nil?
      render json: { 'result' => 'No cab details found' }
    else
      render json: driver.cab
    end
  end

  private

  def driver_params
    params.require(:driver).permit(:name, :phone, :availability, :licence)
  end
end
