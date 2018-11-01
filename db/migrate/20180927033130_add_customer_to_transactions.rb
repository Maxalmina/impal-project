class AddCustomerToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_reference :transactions, :customer, foreign_key: { to_table: :users }
  end
end
