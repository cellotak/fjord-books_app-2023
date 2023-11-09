# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:day1)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_on 'ログイン'
    assert_text 'ログインしました。'
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報の一覧'
  end

  test 'should create report' do
    visit reports_url
    click_on '日報の新規作成'

    fill_in 'タイトル', with: 'バグ修正'
    fill_in '内容', with: 'バグを修正しました。'
    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_selector 'p', text: 'バグ修正'
    assert_selector 'p', text: 'バグを修正しました。'
  end

  test 'should update Report' do
    visit report_url(@report)
    click_on 'この日報を編集', match: :first

    fill_in 'タイトル', with: '課題再提出'
    fill_in '内容', with: '課題を再提出しました。'
    click_on '更新する'

    assert_text '日報が更新されました。'
    assert_selector 'p', text: '課題再提出'
    assert_selector 'p', text: '課題を再提出しました。'
  end

  test 'should destroy Report' do
    visit report_url(@report)
    click_on 'この日報を削除', match: :first

    assert_text '日報が削除されました。'
    assert_selector 'h1', text: '日報の一覧'
    refute_selector 'p', text: '課題提出'
  end
end
