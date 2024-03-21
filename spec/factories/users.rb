FactoryBot.define do

  factory :user do
    email { Faker::Internet.email }
    password { "user123" }
    first_name { Faker::Movies::LordOfTheRings.character }
    last_name { Faker::Movies::HarryPotter.spell }
    description { Faker::Games::WorldOfWarcraft.quote }
    is_admin { false }
    is_teacher { false }
    is_subscriber { true }
  end

end