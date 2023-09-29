class TransactionController < ApplicationController
  def last_day_earning_by_driver_id
    driver = Driver.find_by(id: params[:id])
    if driver.nil?
      render json: { 'result' => 'Params Missing or Invalid' }
    else
      render json: { 'Driver' => driver,
                     'earnings_today' =>
                                      Transaction.select_day_earning(params[:id]) }
    end
  end

  def payment_details
    transaction = Transaction.new(payment_params)
    if transaction.nil?
      render json: { 'result' => 'Params Missing or Invalid' }
    else

      trans_details = Transaction.find_by(booking_id: transaction.booking_id)

      if !trans_details.nil? && (trans_details.status == 'SUCCESS')
        render json: { 'msg' => 'Payment Already Done' }
        return
      end

      transaction.update(status: :SUCCESS)

      invoice_id = "PYTM#{SecureRandom.hex(5)}" if params[:gateway] == 'PAYTM'
      invoice_id = "RZRP#{SecureRandom.hex(6)}" if params[:gateway] == 'RAZORPAY'
      invoice_id = "BLK#{SecureRandom.hex(6)}" if params[:gateway] == 'BILLDESK'

      transaction.update(invoice_id: invoice_id)
      if transaction.save
        render json: { 'Transaction' => transaction, 'msg' => 'Payment Successful' }
      else
        render json: { 'msg' => 'Payment Failed' }
      end

    end
  end

  private

  def payment_params
    params.require(:transaction).permit(:gateway, :amount, :booking_id)
  end
end
