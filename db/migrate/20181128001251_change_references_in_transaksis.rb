class ChangeReferencesInTransaksis < ActiveRecord::Migration[5.2]
  def change
    remove_reference :transaksis, :user
    add_reference :transaksis, :user
  end
end
