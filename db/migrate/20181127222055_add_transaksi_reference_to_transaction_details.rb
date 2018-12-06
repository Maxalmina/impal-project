class AddTransaksiReferenceToTransactionDetails < ActiveRecord::Migration[5.2]
  def change
    add_reference :transaction_details, :transaksi, foreign_key: true
  end
end
