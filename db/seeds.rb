# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# DESTROY ALL TABLE BEFORE EVERY SEEDS
Attendance.destroy_all
Event.destroy_all
User.destroy_all   



# ----------------------------------------- CREATION OF ALL USERS ----------------------------------
all_users = []
admin_emails = ['damiengeneret@outlook.com', 'toto@gmail.com', 'scherer.alexia@gmail.com', 'ra.marcarini@gmail.com']

# Creation of 4 admin accounts
admin_emails.each do |email|
    password = "admin123"
    password_confirmation = password
    user = User.new(email: email, password: password, first_name: Faker::Movies::LordOfTheRings.character,
    last_name: Faker::Movies::HarryPotter.spell, password_confirmation: password_confirmation, is_admin: true, is_teacher: false, is_subscriber: false)
    user.save!
end
#Creation of 4 teachers
4.times do
    all_users << User.create(email: Faker::Internet.email, password: "teacher123", first_name: Faker::Movies::LordOfTheRings.character,
    last_name: Faker::Movies::HarryPotter.spell, description: Faker::Movies::LordOfTheRings.quote, is_admin: false, is_teacher: true, is_subscriber: false)
end
# Creation of 20 paying students accounts
20.times do
 all_users << User.create(email: Faker::Internet.email, password: "student123", first_name: Faker::Movies::LordOfTheRings.character,
  last_name: Faker::Movies::HarryPotter.spell, description: Faker::Movies::LordOfTheRings.quote, is_admin: false, is_teacher: false, is_subscriber: true)  
end

#Creation of 10 NON-paying students accounts
10.times do
    all_users << User.create(email: Faker::Internet.email, password: "user123", first_name: Faker::Movies::LordOfTheRings.character,
    last_name: Faker::Movies::HarryPotter.spell, description: Faker::Movies::LordOfTheRings.quote, is_admin: false, is_teacher: false, is_subscriber: false)  
end

# ----------------------------------------- CREATION OF ALL EVENTS ----------------------------------

#Creation of 25 events
all_events = []

25.times do
    # pre-generate the number of seats (max)
    max_seats = rand(5..15)
    all_events << Event.create(creator: User.where(is_teacher: true).or(User.where(is_admin: true)).all.sample,
     category: Event::CATEGORIES.sample, instrument: Event::INSTRUMENTS.slice(1..).sample, level: rand(1..5), price: rand(0..25),
      start_date: Faker::Date.forward(days: 90), duration: rand(60..120), location: Faker::Address.street_address,
      description: Faker::Lorem.sentence(word_count: 15), max_seats: max_seats, available_seats: max_seats)
end

#----------------------------------------------------- CREATION OF THE ATTENDANCES -------------------------------

#Creation of 50 Attendances
50.times do
    Attendance.create(attendee: User.where(is_subscriber: true).sample, event: Event.all.sample)
end