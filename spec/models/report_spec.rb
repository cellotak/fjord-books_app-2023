require 'rails_helper'

RSpec.describe Report, type: :model do
  describe '#editable?' do
    let(:report) {report_create_user.reports.new}
    let(:report_create_user) { User.new }

    context "for report create user" do
      it "is editable" do
        expect(report.editable?(report_create_user)).to be true
      end
    end

    context "for non report create user" do
      let(:non_report_create_user) { User.new }

      it "is not editable" do
        expect(report.editable?(non_report_create_user)).to be false
      end
    end
  end

  describe '#created_on' do
   let(:report) {user.reports.create!(title: 'test', content: 'This is test')}
   let(:user) { User.create!(email: 'foo@example.com', name: 'Alice', password: 'hogepass') }

    it "indicate the date the report was created" do
      expect(report.created_on).to eq Date.current
    end
  end
end
