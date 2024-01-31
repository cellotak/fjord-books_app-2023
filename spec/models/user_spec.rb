require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#name_or_email' do
    let(:user_with_name) { User.new(email: 'foo@example.com', name: 'Alice', password: 'hogepass')}
    
    context 'when user name is present' do
      it 'returns user name' do
        expect(user_with_name.name_or_email).to eq 'Alice'
      
      end
    end

    context 'when user name is nil' do
      let(:user_without_name) { User.new(email: 'foo@example.com', password: 'hogepass')}
      it 'returns email adress' do
        expect(user_without_name.name_or_email).to eq 'foo@example.com'
      end
    end
  end
end
