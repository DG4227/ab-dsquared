class AddPersonTypeToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :persontype, :string
  end
end
