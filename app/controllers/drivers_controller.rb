# frozen_string_literal: true

require 'json'

# This class manages the actions related to drivers
class DriversController < ApplicationController
  def available_driver
    # drivers = Driver.all

    # fresh_when drivers

    cache_key = "drivers_index/#{Driver.maximum(:updated_at).to_i}"

    @redis = Redis.new(url: ENV['REDIS_URL'])
    @cached_data = @redis.mget(cache_key, 'available_driver_updated_at')
    # Compare the timestamp of the cached data with the
    # timestamp of the data from the server
    if @cached_data[1].to_i < cache_key.split('/').last.to_i
      # If the data from the server is newer than the cached data,
      # expire the cache and fetch the data from the server
      @redis.mset(cache_key, Driver.available.to_a.to_json,
                  'available_driver_updated_at',
                  Driver.maximum(:updated_at).to_i)
      @cached_data = @redis.mget(cache_key, 'available_driver_updated_at')
    end

    # Set the cache expiration time

    @redis.expire(cache_key, 1.hour.to_i)
    @redis.expire('available_driver_updated_at', 1.hour.to_i)
    render json: JSON.parse(@cached_data[0])
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

  def update_driver_availability
    driver = Driver.find_by(id: params[:id])
    if driver.nil?
      render json: { 'result' => 'No driver found' }
    else
      driver.update(availability: params[:availability])
      driver.cab.update(availability: params[:availability])
      render json: { result: "Driver successfully activated" } if driver.availability
      unless driver.availability
        render json: { result: "Driver successfully deactivated" }
      end
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
