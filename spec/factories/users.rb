FactoryBot.define do
  factory :user do

    email {FFaker::Internet.safe_email}
    name { 'User Name'}
    password { 'test1234TEST' }
  end
end
