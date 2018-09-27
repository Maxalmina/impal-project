class ReportDetail < ApplicationRecord
  belongs_to :transaction
  belongs_to :report
end
