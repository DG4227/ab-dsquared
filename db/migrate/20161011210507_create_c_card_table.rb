class CreateCCardTable < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_cards do |t|
      t.string :holders_name
      t.string :number
      t.string :card_type
      t.string :cvc
      t.string :expiry_date
    end
  end
end
