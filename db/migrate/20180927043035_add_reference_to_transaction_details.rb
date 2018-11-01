class AddReferenceToTransactionDetails < ActiveRecord::Migration[5.2]
  def change
    add_reference :transaction_details, :furniture, foreign_key: true
    add_reference :transaction_details, :transaction, foreign_key: true
  end
end
