class CreateBookingsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.string :passenger_id
      t.string :customer_address_id
      t.string :credit_card_id
      t.string :flight_segment_id
    end
  end
end
