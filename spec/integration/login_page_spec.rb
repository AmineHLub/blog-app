require 'rails_helper'

RSpec.describe 'Login page', js: true, type: :feature do
  before(:all) do
    @first_user = User.create(name: 'Mark', photo: 'photos_url',
                              bio: 'Stuff about mark',
                              posts_counter: 0, email: 'mark@gmail.com',
                              password: '0123456', confirmed_at: Time.now)
    @second_user = User.create(name: 'Angela', photo: 'photos_url',
                               bio: 'Stuff about her',
                               posts_counter: 0, email: 'angel@gmail.com', password: 'abcdefg', confirmed_at: Time.now)
    @first_post = Post.create(title: 'My first post', text: 'This is my first post',
                              user_id: @first_user.id, comments_counter: 0, likes_counter: 0)
    @second_post = Post.create(title: 'My second post', text: 'This is my second post',
                               user_id: @first_user.id, comments_counter: 0, likes_counter: 0)
    @third_post = Post.create(title: 'My third post', text: 'This is my third post',
                              user_id: @first_user.id, comments_counter: 0, likes_counter: 0)
    @fourth_post = Post.create(title: 'My fourth post', text: 'This is my fourth post',
                               user_id: @first_user.id, comments_counter: 0, likes_counter: 0)
    Comment.create(text: 'This is my first comment', user_id: @second_user.id, post_id: @fourth_post.id)
    Comment.create(text: 'This is my second comment', user_id: @first_user.id, post_id: @fourth_post.id)
  end

  describe 'Login Page requirements' do
    it 'has username and password inputs, and Log in button' do
      visit new_user_session_path
      expect(page).to have_field('user_email')
      expect(page).to have_field('user_password')
      expect(page).to have_button('Log in')
    end
  end

  describe 'When the submit button is clicked' do
    it 'submits with out username and password inputs' do
      visit new_user_session_path
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: ''
      click_button 'Log in'
      expect(page).to have_content('Sign up')
    end

    it 'has incorrect username and password' do
      visit new_user_session_path
      fill_in 'user_email', with: 'sam@gmail.com'
      fill_in 'user_password', with: '0000'
      click_button 'Log in'
      expect(page).to have_content('Forgot your password')
    end

    it 'can log in with correct data' do
      visit new_user_session_path
      fill_in 'user_email', with: 'angel@gmail.com'
      fill_in 'user_password', with: 'abcdefg'
      click_button 'Log in'
      expect(page).to have_content('Logout')
    end
  end
end
