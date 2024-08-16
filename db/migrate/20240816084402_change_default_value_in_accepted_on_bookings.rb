class ChangeDefaultValueInAcceptedOnBookings < ActiveRecord::Migration[7.1]
  def change
    change_column_default :bookings, :accepted, nil
  end
end
