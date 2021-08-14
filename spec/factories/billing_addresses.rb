FactoryBot.define do
  factory :billing_address do
    first_name { "MyString" }
    last_name { "MyString" }
    address { "MyString" }
    city { "MyString" }
    country { "MyString" }
    zip { "MyString" }
    phone { "MyString" }
  end
end
