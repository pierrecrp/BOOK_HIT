class AddTargetAddressToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :target_address, :string
  end
end
