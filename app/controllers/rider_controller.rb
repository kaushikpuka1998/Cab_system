# frozen_string_literal: true

require 'json'

# This class represents the Rider Controller in the Cab System application
class RiderController < ApplicationController
  def price_calculator
    distance = params[:distance]
    cab_type = params[:cab_type]
    case cab_type
    when 'prime'
      price = Strategies::PriceCalculatorStrategy.new(distance).make_price_prime
    when 'sedan'

      price = Strategies::PriceCalculatorStrategy.new(distance).make_price_sedan
    end
    render json: { 'cab_price' => price }
  end
end
