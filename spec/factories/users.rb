FactoryBot.define do
  factory :user do

    sequence(:email) { |i| "email#{i}@email.com"}
    name { 'Archius Kheert'}
    password { 'test1234TEST' }
  end
end
