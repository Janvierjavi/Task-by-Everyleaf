
require 'rails_helper'


RSpec.feature "User Login management", type: :feature do
  background do
    User.create( name: 'janvier',
                             email: 'janvier@momo.com',
                             password: 'password',
                             password_confirmation: 'password')
end
  scenario "user registration with successful validations" do
    visit new_user_path

      fill_in 'Name', with: 'janvier'
        fill_in 'Email', with: 'janvier@momo.com'

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
  scenario "expect page to redirect to login when not logged in" do
    visit new_session_path

  end

  scenario "test user creation and user list on the admin page" do
    visit admin_users_path

  end

end
