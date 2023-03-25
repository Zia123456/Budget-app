require 'rails_helper'

RSpec.describe Entity, type: :model do
    before :each do
        @user = User.new(name: 'zia', email: 'zia@gamil.com', password: '123456')
        @entity = Entity.new(name: 'entity 1', amount: 1)
    end

    it 'name must be present' do 
        @entity.name = nil
        expect(@entity).to_not be_valid
    end

    it 'amount must be present' do 
        @entity.amount = nil
        expect(@entity).to_not be_valid
    end

end