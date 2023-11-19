# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    target_user = User.new
    report = target_user.reports.new
    assert report.editable?(target_user)

    non_target_user = User.new
    assert_not report.editable?(non_target_user)
  end

  test '#created_on' do
    @user = users(:alice)
    report = @user.reports.create!(title: 'test', content: 'This is test')
    assert_equal Date.current, report.created_on
  end
end
