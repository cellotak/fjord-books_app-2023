class Mention < ApplicationRecord
  belings_to :report
  belongs_to :mentioning_report, class_name: 'Report'
  belings_to :mentioned_report, class_name: 'Report'
end
