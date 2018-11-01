class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.decimal :totalPayment

      t.timestamps
    end
  end
end
