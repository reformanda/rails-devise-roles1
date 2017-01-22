require 'rails_helper'

RSpec.describe Nomination, :type => :model do
  it "is valid with valid attributes" do
    nomination = FactoryGirl.create(:nomination)
    expect(nomination).to be_valid
  end
end
