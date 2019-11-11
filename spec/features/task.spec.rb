require 'rails_helper'

RSpec.feature "Task management function", type: :feature do
  background do
    User.create( name: 'janvier',
                             email: 'janvier@momo.com',
                             password: 'password',
                             password_confirmation: 'password')
    visit new_session_path
    fill_in 'email', with: 'janvier@momo.com'
    fill_in 'password', with: 'password'
    click_button 'Log in'
    @user = User.first
    Task.create(
      name: 'task1',
      status: 'Not started',
      details: 'content1',
      priority:'High',
      arrive: '2019-11-18 23:10:00 +0900',
      leave: '2019-11-19 23:10:00 +0900',
      user_id: @user.id)
  end

  scenario "Test task list" do
    visit tasks_path
  end
  scenario "Test task creation" do
    visit new_task_path
    fill_in 'Name', with: 'janvier'
    fill_in 'Details', with: 'what '
    click_button 'create task'

  end

  scenario "Test whether tasks are arranged in descending order of creation date" do
    Task.all.order('created_at desc')
    visit tasks_path
  end

  scenario "Test if tasks are ordered by deadline" do
    visit tasks_path
    click_link 'High priority'
    assert Task.all.order('end_at desc')

  end
  scenario "Test search by title" do
    visit tasks_path
    fill_in 'name', with: 'task1'
    click_button 'search'
    visit tasks_path

  end

  scenario "Test search by status" do
    visit tasks_path
    fill_in 'status', with: 'In progress'
    click_button 'search'
    visit tasks_path
  end

  scenario "Test search by both title and status" do
    visit tasks_path
    fill_in 'name', with: 'what gi'
    fill_in 'status', with: 'Done'
    click_button 'search'
    visit tasks_path
  end

  scenario "Test sort by priority" do
    visit tasks_path
    click_link 'High priority'
    assert Task.all.order('priority desc')
  end

end
