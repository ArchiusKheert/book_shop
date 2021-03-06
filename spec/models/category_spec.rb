require 'rails_helper'

RSpec.describe Category, type: :model do
  before :each do
    @category = FactoryBot.create(:category)
  end

  subject {@category}

  it { expect(subject).to validate_presence_of :name }
  it { expect(subject).to validate_uniqueness_of :name }
  it { expect(subject).to validate_length_of :name }

  it { expect(subject).to have_many(:books) }
end
