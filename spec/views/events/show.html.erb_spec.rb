require 'rails_helper'

RSpec.describe "events/show", type: :view do
  before(:each) do
    assign(:event, Event.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/category/)
    expect(rendered).to match(/Instrument/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/2024-03-20 10:22:04/)
    expect(rendered).to match(/5/)
  end
end
