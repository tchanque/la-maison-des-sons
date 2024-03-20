require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
      creator: User.create(email: Faker::Internet.email, password: "teacher123", first_name: Faker::Movies::LordOfTheRings.character,
      last_name: Faker::Movies::HarryPotter.spell, description: Faker::Movies::LordOfTheRings.quote, is_admin: false, is_teacher: true, is_subscriber: false),
      category: "Type",
      instrument: "MyString",
      level: 1,
      price: 1,
      duration: 1,
      description: "MyText",
      location: "MyString",
      start_date: "2024-03-20 10:22:04",
      available_seats: 1
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input[name=?]", "event[category]"

      assert_select "input[name=?]", "event[instrument]"

      assert_select "input[name=?]", "event[level]"

      assert_select "input[name=?]", "event[price]"

      assert_select "input[name=?]", "event[duration]"

      assert_select "textarea[name=?]", "event[description]"

      assert_select "input[name=?]", "event[location]"

      assert_select "input[name=?]", "event[start_date]"

      assert_select "input[name=?]", "event[available_seats]"
    end
  end
end
