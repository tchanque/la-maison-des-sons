FactoryBot.define do
  factory :attendance do
    # create a fake user, will need to be replaced by FactoryBot.create(:user) once we write it
    # attendee { User.create(email: Faker::Internet.email, password: "student123", first_name: Faker::Movies::LordOfTheRings.character,
    # last_name: Faker::Movies::HarryPotter.spell, description: Faker::Movies::LordOfTheRings.quote,
    #  is_admin: false, is_teacher: false, is_subscriber: true) }
     
    attendee {FactoryBot.create(:user)} 
    event {FactoryBot.create(:event)}
  end
end
