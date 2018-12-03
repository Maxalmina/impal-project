class CreateTransactionDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :transaction_details do |t|
      t.integer :quantity
      t.references :furniture, foreign_key: true

      t.timestamps
    end
  end
end
