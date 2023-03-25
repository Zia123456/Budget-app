require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(name: 'zia', email: 'zia@gmail.com', password: '123456')
  end

  it 'name must be valid with correct parameters' do
    expect(@user).to be_valid
  end

  it 'name must be present' do
    @user.name = nil
    expect(@user).to_not be_valid
  end
end
