# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    target_user = User.new
    non_target_user = User.new
    report = target_user.reports.new

    assert report.editable?(target_user)
    refute report.editable?(non_target_user)
  end

  test '#created_on' do
    today = Date.current
    @user = users(:alice)
    report = @user.reports.create!(title: 'test', content: 'This is test')
    assert_equal today, report.created_on
  end
end
