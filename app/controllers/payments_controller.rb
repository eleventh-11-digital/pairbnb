class PaymentsController < ApplicationController

  def create
    reservation = Reservation.find(params[:payment][:reservation_id])
    nonce = params[:payment_method_nonce]
    render action: :new and return unless nonce
    result = Braintree::Transaction.sale(
      amount: "#{reservation.payment_price}",
      payment_method_nonce: params[:payment_method_nonce]
    )
    if result.success?
      #make an email send to owner and reservation owner
      flash[:message] = "Payment success!"
      redirect_to reservation_path(reservation)
    else
      flash[:message] = 'Failed. Please try again'
      redirect_to reservation_path(reservation)
    end
    # reserve to save the transaction details into database

  end

end
