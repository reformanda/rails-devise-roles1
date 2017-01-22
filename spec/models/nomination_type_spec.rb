require 'rails_helper'

RSpec.describe NominationType, type: :model do
  it "is valid with valid attributes" do
    nomination_type = FactoryGirl.create(:nomination_type)
    expect(nomination_type).to be_valid
  end
end
