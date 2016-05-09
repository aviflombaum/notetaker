require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.first
  end

  it "has many notebooks" do
    @user.notebooks.create
    expect(@user.notebooks.count).to eq(1)
  end

  it "has many references" do
    @user.references.create
    expect(@user.references.count).to eq(1)
  end


end
