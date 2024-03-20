require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
      type: "",
      instrument: "MyString",
      level: 1,
      price: 1,
      duration: 1,
      description: "MyText",
      location: "MyString",
      available_seats: 1
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input[name=?]", "event[type]"

      assert_select "input[name=?]", "event[instrument]"

      assert_select "input[name=?]", "event[level]"

      assert_select "input[name=?]", "event[price]"

      assert_select "input[name=?]", "event[duration]"

      assert_select "textarea[name=?]", "event[description]"

      assert_select "input[name=?]", "event[location]"

      assert_select "input[name=?]", "event[available_seats]"
    end
  end
end
