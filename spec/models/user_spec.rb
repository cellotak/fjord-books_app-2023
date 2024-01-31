# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#name_or_email' do
    let(:user) { FactoryBot.create(:user) }

    context 'when user name is present' do
      it 'returns user name' do
        expect(user.name_or_email).to eq 'Alice'
      end
    end

    context 'when user name is nil' do
      let(:user) { FactoryBot.create(:user, :without_name) }
      it 'returns email adress' do
        expect(user.name_or_email).to eq 'hoge@example.com'
      end
    end
  end
end
