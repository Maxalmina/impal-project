class AddReferenceToReportDetails < ActiveRecord::Migration[5.2]
  def change
    add_reference :report_details, :report, foreign_key: true
    add_reference :report_details, :transaction, foreign_key: true
  end
end
