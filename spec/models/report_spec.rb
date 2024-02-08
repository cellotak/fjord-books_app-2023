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
      expect(report.created_on).to eq report.created_at.to_date
    end
  end

  describe '#save_mentions' do
    let(:report) { create(:report, content:"http://localhost:3000/reports/#{mentioned_report.id}") }
    let(:mentioned_report) { create(:report) }

    it 'saves mentions' do
      expect(report.mentioning_report_ids).to include mentioned_report.id
    end
  end
end
