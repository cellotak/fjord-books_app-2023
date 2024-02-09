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

  describe '#create' do
    let(:report) { create(:report, content: "http://localhost:3000/reports/#{mentioned_report.id}") }
    let(:mentioned_report) { create(:report) }

    it 'saves mention' do
      expect(report.mentioning_report_ids).to include mentioned_report.id
    end
  end

  describe '#update' do
    let(:report) { create(:report, content: "http://localhost:3000/reports/#{mentioned_report.id}") }
    let(:mentioned_report) { create(:report) }

    context 'when the mention is added' do
      let(:added_mentioned_report) { create(:report) }

      before do
        report.update(content: "http://localhost:3000/reports/#{mentioned_report.id}, http://localhost:3000/reports/#{added_mentioned_report.id}")
      end

      it 'saves added mention' do
        report.mentioning_reports.reload
        expect(report.mentioning_report_ids).to include(mentioned_report.id, added_mentioned_report.id)
      end
    end

    context 'when the mention is deleted' do
      before do
        report.update(content: 'No mention.')
      end

      it 'saves mentions' do
        report.mentioning_reports.reload
        expect(report.mentioning_report_ids).not_to include mentioned_report.id
      end
    end
  end
end
