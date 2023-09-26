class PlaceController < ApplicationController
  def create_place
    if latitude_and_longitude_missing_or_invalid?
      render_json({ msg: 'Latitude or Longitude Missing or Invalid' })
      return
    end

    if name_state_or_pincode_missing?
      render_json({ msg: 'Name or State or Pincode Missing' })
      return
    end

    place = Place.new(place_params)
    location = Location.new(location_params)
    if place.save
      location.place_id = place.id
      if location.save
        place.location = location
        render json: {
          place: place,
          msg: 'Place created successfully'
        }
      end
    else
      render json: { msg: "Error to create place" }
    end
  end

  private

  def latitude_and_longitude_missing_or_invalid?
    params[:latitude].nil? || params[:longitude].nil?
  end

  def name_state_or_pincode_missing?
    params[:name].nil? || params[:state].nil? || params[:pincode].nil?
  end

  def place_params
    params.permit(:name, :state, :pincode)
  end

  def location_params
    params.permit(:latitude, :longitude)
  end
end
