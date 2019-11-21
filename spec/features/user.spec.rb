
require 'rails_helper'
RSpec.feature "User Login management", type: :feature do
  background do
    User.create( name: 'janvier',
                             email: 'janvier@momo.com',
                             password: 'password',
                             password_confirmation: 'password')
end

  scenario "successful user login and logout" do
    User.create(name: 'janvier', email: 'janvier@gmail.com', password: 'password', password_confirmation: 'password')
    visit new_session_path
    fill_in 'email', with: 'janvier@gmail.com'
    fill_in 'password', with: 'password'
    click_button 'Log in'
    visit tasks_path
    click_link 'Logout'
    visit new_session_path
  end

  scenario "successful admin  login and logout" do
    User.create(name: 'janvier', email: 'janvier@gmail.com', password: 'password', password_confirmation: 'password', admin: 'true')
    visit new_session_path
    fill_in 'email', with: 'janvier@gmail.com'
    fill_in 'password', with: 'password'
    click_button 'Log in'
    visit admin_users_path
    click_link 'Logout'
    visit new_session_path
  end

  scenario "expect page to redirect to login when not logged in" do
    visit new_session_path
    fill_in 'email', with: 'janvier@gmail.com'
    fill_in 'password', with: 'password'
    click_button 'Log in'
    visit new_session_path
  end

  scenario "test admin create new user" do
    visit admin_users_path
    click_link 'New User'
    User.create( name: 'janvier',
                             email: 'janvier@momo.com',
                             password: 'password',
                             password_confirmation: 'password')

          visit users_path
        end

        scenario "test user admin  details" do
          visit new_session_path
          fill_in 'email', with: 'janvier@gmail.com'
          fill_in 'password', with: 'password'
          click_button 'Log in'
            visit admin_users_path
          click_link 'Show'
              visit admin_users_path
              end

              scenario "test  admin update user" do
                visit new_session_path
                fill_in 'email', with: 'janvier@gmail.com'
                fill_in 'password', with: 'password'
                click_on 'Log in'
                  visit new_admin_user_path
                  User.update( name: 'janvierj',
                             email: 'janvier@momo.com',
                             password: 'password',
                             password_confirmation: 'password')
                  visit admin_users_path
                    end

              scenario "test user admin delete" do
                visit new_session_path
                fill_in 'email', with: 'janvier@gmail.com'
                fill_in 'password', with: 'password'
                click_on 'Log in'
                User.delete( name: 'janvier',
                             email: 'janvier@momo.com',
                             password: 'password',
                             password_confirmation: 'password')
                visit admin_users_path
                    end

  end
