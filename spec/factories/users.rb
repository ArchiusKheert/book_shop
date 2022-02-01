FactoryBot.define do
  factory :user do

    sequence(:email) { |i| "email#{i}@email.com"}
    name { 'Archius Kheert'}
    password { 'test1234TEST' }
    after(:build) { |user| user.class.skip_callback(:save, :before)}
  end
end
