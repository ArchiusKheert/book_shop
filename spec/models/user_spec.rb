require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = FactoryBot.create(:user)
  end

  subject { @user }

  it { should respond_to (:email)}

  it '#email returns a string' do
    expect(@user.email).to match 'user@example.com'

  end

  it '#first_name returns a string' do
    expect(@user.first_name).to match 'User'
  end

  it '#last_name returns a string' do
    expect(@user.last_name).to match 'Name'
  end
end
