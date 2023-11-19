# frozen_string_literal: true

require 'application_system_test_case'

class LoginTest < ApplicationSystemTestCase
  test 'login' do
    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_on 'ログイン'
    assert_text 'ログインしました。'
  end
end
