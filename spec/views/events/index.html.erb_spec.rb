require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        creator: User.create(email: Faker::Internet.email, password: "teacher123", first_name: Faker::Movies::LordOfTheRings.character,
        last_name: Faker::Movies::HarryPotter.spell, description: Faker::Movies::LordOfTheRings.quote, is_admin: false, is_teacher: true, is_subscriber: false),
        category: "Type",
        instrument: "Instrument",
        level: 2,
        price: 3,
        duration: 4,
        description: "MyText",
        location: "Location",
        start_date: "2024-03-20 10:22:04",
        available_seats: 5
      ),
      Event.create!(
        creator: User.create(email: Faker::Internet.email, password: "teacher123", first_name: Faker::Movies::LordOfTheRings.character,
        last_name: Faker::Movies::HarryPotter.spell, description: Faker::Movies::LordOfTheRings.quote, is_admin: false, is_teacher: true, is_subscriber: false),
        category: "Type",
        instrument: "Instrument",
        level: 2,
        price: 3,
        duration: 4,
        description: "MyText",
        location: "Location",
        start_date: "2024-03-20 10:22:04",
        available_seats: 5
      )
    ])
  end

  it "renders a list of events" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    # assert_select cell_selector, text: Regexp.new("Type".to_s), count: 2
    # assert_select cell_selector, text: Regexp.new("Instrument".to_s), count: 2
    # assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    # assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    # assert_select cell_selector, text: Regexp.new("2024-03-20 10:22:04".to_s), count:2
    # assert_select cell_selector, text: Regexp.new(4.to_s), count: 2
    # assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    # assert_select cell_selector, text: Regexp.new("Location".to_s), count: 2
    # assert_select cell_selector, text: Regexp.new(5.to_s), count: 2
  end
end
