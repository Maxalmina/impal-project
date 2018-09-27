class CreateReportDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :report_details do |t|
      t.string :description
      t.references :transaction, foreign_key: true
      t.references :report, foreign_key: true

      t.timestamps
    end
  end
end
