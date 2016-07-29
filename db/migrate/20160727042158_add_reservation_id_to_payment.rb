class AddReservationIdToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :transaction_id, :integer
    add_column :payments, :reservation_id, :integer
  end
end
