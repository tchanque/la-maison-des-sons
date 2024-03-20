require 'rails_helper'

RSpec.describe Event, type: :model do
  
  before(:each) do
    @event = FactoryBot.create(:event)
  end

  it "has a valid factory" do
    #Test if my factory is valid
    expect((build(:event))).to be_valid
  end

  context "validation" do

      it "is valid with valid attributes" do
        expect(@event).to be_a(Event)
      end

      describe "#category" do
        it { expect(@event).to validate_presence_of(:category) }
      end
      describe "#start_date" do
        it { expect(@event).to validate_presence_of(:start_date) }
      end
      describe "#location" do
        it { expect(@event).to validate_presence_of(:location) }
      end
      describe "#creator" do
        it { expect(@event).to validate_presence_of(:creator) }
      end

  end

  context "assocciations" do
    it { should belong_to(:creator).class_name('User') }
  end

end
