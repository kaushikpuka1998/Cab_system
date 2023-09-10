require 'json'

class CabsController < ApplicationController


    def all_cabs
        all_cabs = Cab.all
        render json: all_cabs
    end

    def cab_details_by_licence
        cab = Cab.find_by(licence_number: params[:licence_number])
        if cab.nil?
            render json: {"result" => "Params Missing or Invalid"}
        else
            render json: {"cab" => cab, "driver" => cab.driver, "location" => cab.location}
        end
    end
end