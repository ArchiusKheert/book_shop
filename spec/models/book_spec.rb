require 'rails_helper'

RSpec.describe Book, type: :model do
  before :each do
    @book = FactoryBot.build(:book)
  end

  subject {@book}

  it {expect(subject).to validate_presence_of :title}
  it {expect(subject).to validate_presence_of :quantity}
  it {expect(subject).to validate_presence_of :price}
  it {expect(subject).to validate_uniqueness_of :title}

  it {expect(subject).to have_many(:authors)}
  it {expect(subject).to belong_to(:categories)}
  it {expect(subject).to have_many(:reviews)}
end
