# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test "#editable?" do
    target_user = User.new
    non_target_user = User.new
    report = target_user.reports.new
    
    assert_equal true, report.editable?(target_user)
    assert_equal false, report.editable?(non_target_user)
  end
end
