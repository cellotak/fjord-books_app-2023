# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'login', type: :system do
  let(:user) { create(:user) }

  scenario 'login' do
    visit root_path
    fill_in 'Eメール', with: user.email
    fill_in 'パスワード', with: user.password
    click_button 'ログイン'
    expect(page).to have_content '本の一覧'
  end
end
