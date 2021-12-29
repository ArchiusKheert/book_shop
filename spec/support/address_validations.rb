Rspec.shared_examples 'address_validations' do
  it {expect(subject).to belong_to :user }
  it {expect(subject).to validate_presence_of(:first_name) }
  it {expect(subject).to validate_presence_of(:last_name) }
  it {expect(subject).to validate_presence_of(:address) }
  it {expect(subject).to validate_presence_of(:city) }
  it {expect(subject).to validate_presence_of(:zip) }
  it {expect(subject).to validate_presence_of(:country) }
  it {expect(subject).to validate_presence_of(:phone) }
  it {expect(subject).to validate_length_of(:first_name).is_at_most(50) }
  it {expect(subject).to validate_length_of(:last_name).is_at_most(50) }
  it {expect(subject).to validate_length_of(:address).is_at_most(50) }
  it {expect(subject).to validate_length_of(:city).is_at_most(50) }
  it {expect(subject).to validate_length_of(:country).is_at_most(50) }
  it {expect(subject).to validate_length_of(:phone).is_at_most(15) }

  it {expect(subject).to allow_value('Archius').for(:first_name) }
  it {expect(subject).to allow_value('Kheert').for(:last_name) }
  it {expect(subject).to allow_value('Netherville').for(:city) }
  it {expect(subject).to allow_value('Rolland street, 11').for(:address) }
  it {expect(subject).not_to allow_value('!@#$%^&*_+').for(:first_name) }
  it {expect(subject).not_to allow_value('!@#$%^&*_+').for(:last_name) }
  it {expect(subject).not_to allow_value('!@#$%^&*_+').for(:city) }
  it {expect(subject).not_to allow_value('!@#$%^&*_+').for(:address) }
end