require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:each) do 
    @user = FactoryBot.create(:user)
  end

  it "has a valid factory" do
    #Test if my factory is valid
    expect((build(:user))).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
    end

    describe "#email" do
      it { expect(@user).to validate_presence_of(:email) }
    end

    describe "#password" do
      it { expect(@user).to validate_presence_of(:password) }
    end

  end

  context "associations" do

  
    describe "events" do
      it { expect(@user).to have_many(:events).through(:attendances) }
    end
  end
  
end