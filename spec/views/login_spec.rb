require 'rails_helper'

RSpec.describe 'Log In page', type: :feature do
  before :each do
    @user1 = User.new(name: 'zia', email: 'zia@gmail.com', password: '123456')
    @user1.save
    visit new_user_session_path
  end

  it 'should see the email field' do
    expect(page).to have_field 'Email'
  end

  it 'should see the password field' do
    expect(page).to have_field 'Password'
  end

  it 'should see the login button' do
    expect(page).to have_button 'Log in'
  end

  it 'should be able to see authenticated route' do
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_on 'Log in'
    expect(page).to have_content('Log in')
  end
end
