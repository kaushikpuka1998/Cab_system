require 'json'

class CabsController < ApplicationController


    def all_cabs
        all_cabs = Cab.all
        render json: all_cabs
    end
end