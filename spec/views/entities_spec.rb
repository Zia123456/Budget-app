require 'rails_helper'

RSpec.describe 'Transaction page', type: :feature do
  before :each do
    @user1 = User.new(name: 'zia', email: 'zia@gmail.com', password: '123456')
    @user1.save
    @category = Group.new(name: 'category 1', icon: 'icon')
    visit new_user_session_path
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_button 'Log in'
  end

  it 'should expect log in before visiting categories page' do
    expect(page).to have_content('Log in')
  end
end
