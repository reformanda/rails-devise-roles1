require 'rails_helper'

RSpec.describe AwardOption, :type => :model do
  it "is valid with valid attributes" do
    expect(AwardOption.new).to be_valid
  end
end
