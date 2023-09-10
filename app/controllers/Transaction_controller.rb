class TransactionController < ApplicationController
    
    def last_day_earning_by_driver_id

        driver = Driver.find_by(id: params[:id])
        if driver.nil?
            render json: {"result" => "Params Missing or Invalid"}
        else
            render json: { "Driver" => driver, 
                         "earnings_today" => Transaction.select_day_earning(params[:id]) 
                        }
        end
    end
end