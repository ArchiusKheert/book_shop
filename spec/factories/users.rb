FactoryBot.define do
  factory :user do

    email {'user@example.com'}
    name { 'User Name'}
    password { 'test1234' }
  end
end
