# frozen_string_literal: true

require 'json'
# This class handles all the requests related to cabs
class CabsController < ApplicationController
  def all_cabs
    all_cabs = Cab.all
    render json: all_cabs
  end

  def cab_details_by_licence
    cab = Cab.find_by(licence_number: params[:licence_number])
    if cab.nil?
      render json: { 'result' => 'Params Missing or Invalid' }
    else
      render json: { 'cab' => cab,
                     'driver' => cab.driver,
                     'location' => cab.location }
    end
  end

  def cab_list_given_location
    latitude = params[:latitude]
    longitude = params[:longitude]
    if latitude.nil? || longitude.nil?
      render json: { 'result' => 'Params Missing or Invalid' }
      return
    end
    cablist = Location.finding_fiftykm_nearest_all_cabs(latitude, longitude)
    if cablist.nil?
      render json: { 'result' => 'Outside the range' }
    else
      cabs = cablist.map { |cab| cab_detail(cab.cab) }
      render json: { cabs: cabs }
    end
  end

  def find_cab
    place = Place.find_by(name: params[:place_name])
    rider_id = params[:rider_id]
    cab_type = params[:cab_type]
    if place.nil?
      render json: { 'msg' => 'Place not found' }
      return
    end

    latitude = place.location.latitude
    longitude = place.location.longitude

    current_latitude = params[:current_latitude]
    current_longitude = params[:current_longitude]

    distance = Math.sqrt((current_latitude - latitude).abs**2 +
      (current_longitude - longitude).abs**2) * 100

    case cab_type.downcase
    when 'prime'
      price = Strategies::PriceCalculatorStrategy.new(distance).make_price_prime
    when 'sedan'
      price = Strategies::PriceCalculatorStrategy.new(distance).make_price_sedan
    end

    cablist = Location.finding_fiftykm_nearest_cab(latitude, longitude, current_latitude,
                                                   current_longitude, cab_type)
    if cablist.nil? || cablist.empty?
      render json: { 'result' => 'No cab Found Sorry' }
      return
    end

    booking = Booking.new(rider_id: rider_id,
                          driver_id: cablist.first.cab.driver_id,
                          status: Booking.statuses[:in_progress])
    if booking.save
      Cab.find_by(id: cablist.first.cab.id).update(availability: false)
      driver_details = Driver.find(cablist.first.cab.driver_id)
      render json: { booking: booking,
                     driver_details: driver_details,
                     price: format('%.2f', price.to_d),
                     msg: 'Booking created successfully' }
    else
      render json: { msg: 'Error to create booking' }
    end
  end

  private

  def cab_detail(cab)
    { cab: cab, driver: cab.driver, location: cab.location }
  end

  def booking_params
    params.permit(:rider_id, :driver_id, :status)
  end
end
