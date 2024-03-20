FactoryBot.define do
  factory :event do
    type { "" }
    instrument { "MyString" }
    level { 1 }
    price { 1 }
    start_date { "2024-03-20 10:22:04" }
    duration { 1 }
    description { "MyText" }
    location { "MyString" }
    available_seats { 1 }
  end
end
