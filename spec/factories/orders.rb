FactoryBot.define do
  factory :order do
    number { "MyString" }
    status { "MyString" }
    total { "9.99" }
    completed_at { "2021-07-31 15:50:43" }
    user { nil }
  end
end
