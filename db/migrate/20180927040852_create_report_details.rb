class CreateReportDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :report_details do |t|
      t.string :description

      t.timestamps
    end
  end
end
