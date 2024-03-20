require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  let(:event) {
    Event.create!(
      type: "",
      instrument: "MyString",
      level: 1,
      price: 1,
      duration: 1,
      description: "MyText",
      location: "MyString",
      available_seats: 1
    )
  }

  before(:each) do
    assign(:event, event)
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(event), "post" do

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
