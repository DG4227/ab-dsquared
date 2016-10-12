class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :passenger_id, :string
    add_column :users, :cc_id, :string
    add_column :users, :customer_address_id, :string
  end
end
