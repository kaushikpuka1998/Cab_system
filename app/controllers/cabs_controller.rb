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

    cablist = Location.finding_fiftykm_nearest_all_cabs(latitude, longitude)
    if cablist.nil?
      render json: { 'result' => 'Outside the range' }
    else
      cabs = cablist.map { |cab| cab_detail(cab.cab) }
      render json: { cabs: cabs }
    end
  end

  private

  def cab_detail(cab)
    { cab: cab, driver: cab.driver, location: cab.location }
  end
end
