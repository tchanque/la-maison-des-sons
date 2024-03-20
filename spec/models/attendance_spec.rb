require 'rails_helper'

RSpec.describe Attendance, type: :model do
  
  before(:each) do
    @attendance = FactoryBot.create(:attendance)
  end

  it "has a valid factory" do
    #Test if my factory is valid
    expect((build(:attendance))).to be_valid
  end

  context "assocciations" do
    it { should belong_to(:attendee).class_name('User') }
    it { should belong_to(:event)}
  end

end
