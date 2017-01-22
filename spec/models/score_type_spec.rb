require 'rails_helper'

RSpec.describe ScoreType, type: :model do
  it "is valid with valid attributes" do
    score_type = FactoryGirl.create(:score_type)
    expect(score_type).to be_valid
  end
end
