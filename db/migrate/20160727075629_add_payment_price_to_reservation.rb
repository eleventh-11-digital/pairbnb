class AddPaymentPriceToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :payment_price, :integer
  end
end
