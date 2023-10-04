class MentionValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)

    new_mentioned_report_ids = value.scan(%r{http://127.0.0.1:3000/reports/(\d+)}).map { |captured_str| captured_str[0].to_i }

    new_mentioned_report_ids.each do |new_mentioned_report_id|
      unless Report.exists?(new_mentioned_report_id)
        record.errors.add(:content, :wrong_mention)
        break
      end
    end
  end
end
