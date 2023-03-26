require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do
    @user = User.new(name: 'zia', email: 'zia@gamil.com', password: '123456')
    @group = Group.new(name: 'group 1', icon: 'icon')
  end

  it 'name must be present' do
    @group.name = nil
    expect(@group).to_not be_valid
  end

  it 'icon must be present' do
    @group.icon = nil
    expect(@group).to_not be_valid
  end
end
