FactoryBot.define do
  factory :user do

    email {'user@example.com'}
    first_name { 'User' }
    last_name { 'Name' }
    password { 'test1234' }
  end
end
