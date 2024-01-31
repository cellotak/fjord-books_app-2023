# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Reports", type: :system do
  scenario "user visits the index" do
    visit root_url
    expect(page).to have_selector "h2"
  end
end
