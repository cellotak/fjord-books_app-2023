# frozen_string_literal: true

class MentionValidator < ActiveModel::EachValidator
  def validate_each(record, _attribute, value)
    new_mentioned_report_ids = value.scan(%r{http://127.0.0.1:3000/reports/(\d+)}).map { |captured_str| captured_str[0].to_i }

    record.errors.add(:content, :wrong_mention) unless Report.where(id: new_mentioned_report_ids).count == new_mentioned_report_ids.size
  end
end
