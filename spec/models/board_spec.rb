require 'rails_helper'

RSpec.describe Board, :type => :model do
  it "is valid with valid attributes" do
    expect(Board.new).to be_valid
  end
end
