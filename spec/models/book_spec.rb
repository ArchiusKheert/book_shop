require 'rails_helper'

RSpec.describe Book, type: :model do
  before :each do
    @book = FactoryBot.create(:book)
  end

  subject {@book}

  it {expect(subject).to validate_presence_of :title}
  it {expect(subject).to validate_presence_of :quantity}
  it {expect(subject).to validate_presence_of :price}
  it {expect(subject).to validate_uniqueness_of :title}

  it {expect(subject).to have_and_belongs_to_many(:authors)}
  it {expect(subject).to have_and_belongs_to_many(:categories)}
  it {expect(subject).to have_many(:reviews)}
end
