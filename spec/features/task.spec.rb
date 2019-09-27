require 'rails_helper'
RSpec.feature "Task management function", type: :feature do
  background do
    Task.create!(name: 'test', details: 'hello guys', arrive: '2019-09-25 18:07:00 +0900' , leave: '2019-09-25 18:05:00 +0900')
    Task.create!(name: 'task_02', details: 'put down.', arrive: '2019-09-25 18:07:00 +0900' , leave: '2019-09-25 18:05:00 +0900')
  end
  scenario "Test task list" do
  visit tasks_path
  end
  scenario "Test task creation" do
        visit new_task_path
  fill_in 'Name', with: 'test'
  fill_in 'Details', with: 'new details'
  click_button '登録する'
         visit tasks_path
  end
  scenario "Test task details" do
    Task.create!(name: 'test', details: 'hello guys', arrive: '2019-09-25 18:07:00 +0900' , leave: '2019-09-25 18:05:00 +0900')
    visit tasks_path
  end
  scenario "Test whether tasks are arranged in descending order of creation date" do
    Task.all.order('arrive desc')
    Task.order('arrive desc').to_a.should ==   Task.all.order('arrive desc')
  end

end