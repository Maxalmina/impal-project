class CreateTransactionDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :transaction_details do |t|
      t.integer :quantity
      t.decimal :totalPrice

      t.timestamps
    end
  end
end
