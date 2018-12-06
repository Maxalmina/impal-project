class RenameTransactionsToTransaksis < ActiveRecord::Migration[5.2]
  def change
    rename_table :transactions, :transaksis
  end
end
