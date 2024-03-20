FactoryBot.define do

  factory :event do
    creator { User.create(email: Faker::Internet.email, password: "teacher123", first_name: Faker::Movies::LordOfTheRings.character,
    last_name: Faker::Movies::HarryPotter.spell, description: Faker::Movies::LordOfTheRings.quote, is_admin: false, is_teacher: true, is_subscriber: false) }
    category { "stage" }
    instrument { "batterie" }
    level { 1 }
    price { 15 }
    start_date { "2024-03-20 10:22:04".to_datetime }
    duration { 60 }
    description { "Un joli petit stage d'été pour apprendre à jouer de la batterie ! Instrument fournit durant le stage, APPORTEZ JUSTE VOS BAGUETTES et vos pads ;)" }
    location { "Rue Zanzibarre, ZibarreCity, 4890" }
    available_seats { 10 }
  end
end
