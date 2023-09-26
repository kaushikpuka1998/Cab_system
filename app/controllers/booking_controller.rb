require 'json'

class BookingController < ApplicationController
  def create_booking
    booking = Booking.new(booking_params)
    booking.status = Booking.statuses[:in_progress]
    if booking.save
      render json: { booking: booking, msg: 'Booking created successfully' }
    else
      render json: booking.errors
    end
  end

  private

  def booking_params
    params.permit(:rider_id, :driver_id, :status)
  end
end
