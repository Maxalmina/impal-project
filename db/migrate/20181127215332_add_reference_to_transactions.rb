class AddReferenceToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_reference :transactions, :user, foreign_key: true
    add_reference :transactions, :produsen, foreign_key: true
  end
end
