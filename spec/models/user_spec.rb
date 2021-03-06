require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = FactoryBot.create(:user)
  end

  subject { @user }

  it { expect(subject).to validate_presence_of :email }
  it { expect(subject).to validate_confirmation_of :password }
  it { expect(subject).to validate_length_of :password }
  it { expect(subject).to have_many(:reviews) }

end
