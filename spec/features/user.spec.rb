
require 'rails_helper'
RSpec.feature "user management function", type: :feature do


user =  User.create(name: 'janvier',
                           email: 'janvier@gmail.com',
                           password: 'password',
                           password_confirmation: 'password')
  visit new_session_path
  fill_in 'email', with: 'janvier@gmail.com'
  fill_in 'password', with: 'password'
      visit tasks_path
  @user = User.first
end
