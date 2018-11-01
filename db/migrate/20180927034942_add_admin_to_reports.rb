class AddAdminToReports < ActiveRecord::Migration[5.2]
  def change
    add_reference :reports, :admin, foreign_key: { to_table: :users }
  end
end
