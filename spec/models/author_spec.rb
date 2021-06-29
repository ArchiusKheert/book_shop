require 'rails_helper'

RSpec.describe Author, type: :model do
  before :each do
    @author = FactoryBot.create(:author)
  end

  subject {@author}

  it { expect(subject).to validate_presence_of :first_name}
  it { expect(subject).to validate_length_of :first_name}
  it { expect(subject).to validate_length_of :last_name}

  it {expect(subject).to have_and_belongs_to_many(:books)}

end
