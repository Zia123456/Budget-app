require 'rails_helper'

RSpec.describe 'Signup page', type: :feature do
  before :each do
    @user1 = User.new(name: 'zia', email: 'zia@gmail.com', password: '123456',
                      password_confirmation: '123456')
    visit new_user_registration_path
  end

  it 'should see the inputs (fields) in register page' do
    expect(page).to have_field 'Name'
    expect(page).to have_field 'Email'
    expect(page).to have_field 'Password'
    expect(page).to have_field 'Password confirmation'
  end

  it 'should see the sign up button' do
    expect(page).to have_button 'Sign up'
  end

  it 'should be able to sign up successfully and go to categories page' do
    fill_in 'Name', with: @user1.name
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    fill_in 'Password confirmation', with: @user1.password_confirmation
    click_button 'Sign up'
    expect(page).to have_content('A message with a confirmation link has been sent to your email address. Please follow the link to activate your account')
  end

  it 'should error appears if you entered wrong data' do
    fill_in 'Name', with: ''
    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    fill_in 'Password confirmation', with: ''
    click_button 'Sign up'
    expect(page).to have_content('3 errors')
    expect(page).to have_content('Email can\'t be blank')
    expect(page).to have_content('Password can\'t be blank')
    expect(page).to have_content('Name can\'t be blank')
  end

  it "should error appears if the password don't match confirm" do
    fill_in 'Name', with: @user1.name
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    fill_in 'Password confirmation', with: ''
    click_button 'Sign up'
    expect(page).to have_content('1 error')
    expect(page).to have_content('Password confirmation doesn\'t match Password')
  end

  it 'should error appears if email already taken' do
    @user1.save
    fill_in 'Name', with: @user1.name
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    fill_in 'Password confirmation', with: @user1.password_confirmation
    click_button 'Sign up'
    expect(page).to have_content('1 error prohibited this user from being saved:')
    expect(page).to have_content('Email has already been taken')
  end
end