require 'rails_helper'

RSpec.describe 'Login page', js: true, type: :feature do
  before(:all) do
    @first_user = User.create(name: 'John', photo: 'photo_url', bio: 'I am a developer', confirmed_at: Time.now,
                              posts_counter: 0, email: 'iyadicy@gmail.com', password: '12345', role: 'admin')
  end

  describe 'Login Page requirements' do
    it 'has username and password inputs, and Log in button' do
      visit user_session_path
      expect(page).to have_field('user_email')
      expect(page).to have_field('user_password')
      expect(page).to have_button('Log in')
    end
  end

  describe 'When the submit button is clicked' do
    it 'submits with out username and password inputs' do
      visit user_session_path
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: ''
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'has incorrect username and password' do
      visit user_session_path
      fill_in 'user_email', with: 'sam@gmail.com'
      fill_in 'user_password', with: '0000'
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'can log in with correct data' do
      visit user_session_path
      fill_in 'user_email', with: 'iyadicy@gmail.com'
      fill_in 'user_password', with: '12345'
      click_button 'Log in'
      expect(page).to have_content('Signed in successfully.')
    end
  end
end
