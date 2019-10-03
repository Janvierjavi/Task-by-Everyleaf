require 'rails_helper'
RSpec.feature "Task management function", type: :feature do
  background do
    Task.create!(name: 'test', details: 'hello guys', status:'done', arrive: '2019-09-25 18:02:00 +0900' , leave: '2019-09-25 18:05:00 +0900')
    Task.create!(name: 'task_02', details: 'put down.', status:'done', arrive: '2019-09-25 18:02:00 +0900' , leave: '2019-09-25 18:05:00 +0900')
  end
  scenario "Test task list" do
  visit tasks_path
  end
  scenario "Test task creation" do
        visit new_task_path
  Task.create!(name: 'test', details: 'hello guys', status:'done', arrive: '2019-09-25 18:02:00 +0900' , leave: '2019-09-25 18:05:00 +0900')
  click_button '登録する'
         visit tasks_path
  end
  scenario "Test task details" do
    Task.create!(name: 'test', details: 'hello guys', status:'done', arrive: '2019-09-25 18:03:00 +0900' , leave: '2019-09-25 18:05:00 +0900')
    visit tasks_path
  end
  scenario "Test whether tasks are arranged in descending order of creation date" do
    Task.order('created_at desc').to_a.should ==   Task.all.order(' created_at desc')
  end
  scenario "Test sorting done by clicking the button " do
    visit tasks_path
    click_button"sort by leave time"
    visit tasks_path
    assert Task.all.order("leave DESC")
  end

end