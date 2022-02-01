require 'rails_helper'

RSpec.describe Address, type: :model do
  include_examples 'address_validations'

  describe 'scoped' do
    before(:all) {FactoryBot.create_list(:address,32)}

    describe 'billing' do
      subject( Address.billing)

      it 'contain only one type of address' do
        expect(subject.map(&:type).uniq.size).to eq 1
      end

      it 'only billing' do
        expect(subject.sample.type).to eq to 'Billing'
      end

    end

    describe 'shipping' do
      subject( Address.shipping)

      it 'contain only one type of address' do
        expect(subject.map(&:type).uniq.size).to eq 1
      end

      it 'only shipping' do
        expect(subject.sample.type).to eq to 'Shipping'
      end

    end

  end
end
