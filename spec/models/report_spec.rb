# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Report, type: :model do
  let(:report) { create(:report) }

  describe '#editable?' do
    context 'for report create user' do
      it 'is editable' do
        expect(report.editable?(report.user)).to be true
      end
    end

    context 'for non report create user' do
      let(:non_report_create_user) { create(:user) }

      it 'is not editable' do
        expect(report.editable?(non_report_create_user)).to be false
      end
    end
  end

  describe '#created_on' do
    it 'indicate the date the report was created' do
      expect(report.created_on).to eq Date.current
    end
  end
end
