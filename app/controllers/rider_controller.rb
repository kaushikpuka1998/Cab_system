require 'json'

class RiderController < ApplicationController


    def price_calculator
        distance = params[:distance]
        cab_type = params[:cab_type]
        if cab_type == "prime"
            price = Strategies::PriceCalculatorStrategy.new(distance).make_price_prime
        elsif cab_type == "sedan"

            price = Strategies::PriceCalculatorStrategy.new(distance).make_price_sedan
        end
        render json: {"cab_price" => price}
    end
end