# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Reports', type: :system do
  before do
    sign_in user
  end

  let(:user) { report.user }
  let(:report) { FactoryBot.create(:report) }

  scenario 'user visits the report index' do
    visit reports_path
    expect(page).to have_content '日報の一覧'
  end

  scenario 'user visits the report detail' do
    visit report_path(report)
    expect(page).to have_content report.content
  end

  scenario 'user creates the report' do
    visit reports_path
    expect(page).not_to have_content 'バグ修正'
    click_on '日報の新規作成'
    fill_in 'タイトル', with: 'バグ修正'
    fill_in '内容', with: 'バグを修正しました。'
    click_on '登録する'
    expect(page).to have_content '日報が作成されました。'
    expect(page).to have_content 'バグ修正'
  end

  scenario 'user updates the report' do
    visit report_path(report)
    expect(page).to have_content report.title
    expect(page).not_to have_content '課題再提出'
    click_on 'この日報を編集'
    fill_in 'タイトル', with: '課題再提出'
    fill_in '内容', with: '課題を再提出しました。'
    click_on '更新する'
    expect(page).to have_content '日報が更新されました。'
    expect(page).to have_content '課題再提出'
    expect(page).not_to have_content report.title
  end

  scenario 'user destroies the report' do
    visit report_path(report)
    expect(page).to have_content report.content
    click_on 'この日報を削除'
    expect(page).to have_content '日報が削除されました。'
    expect(page).not_to have_content report.content
  end
end
