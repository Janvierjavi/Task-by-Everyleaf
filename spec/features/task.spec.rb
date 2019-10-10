require 'rails_helper'
RSpec.feature "Task management function", type: :feature do
  background do
    Task.create!(name: 'test', details: 'hello guys', status:'done', priority:'High', arrive: '2019-09-25 18:02:00 +0900' , leave: '2019-09-25 18:05:00 +0900')
  end
  scenario "Test task list" do
  visit tasks_path
  end
  scenario "Test task creation" do
        visit new_task_path
        fill_in 'Name', with: 'test'
        fill_in 'Details', with: 'hello guys'
  click_button '登録する'
         visit tasks_path
  end
  scenario "Test task show" do
    task1=Task.first
 visit task_path(id: task1.id)
 expect(page).to have_content('hello guys')
    end
  scenario "Test whether tasks are arranged in descending order of creation date" do
 Task.all.order(' created_at desc')
 visit tasks_path
 expect(page).to have_content 'test'
  end
  scenario "Test task for sorting by leaving time " do
    visit tasks_path
    click_button"sort by leave time"
    visit tasks_path
    assert Task.all.order("leave DESC")
  end 
  scenario "Test sorting by high priority" do
    visit tasks_path
    click_button"sort by high priority"
    assert Task.all.order("priority DESC")
    end
    scenario "Test search by title" do
      visit tasks_path
      expect(page).to have_content 'test'
    end
    scenario "Test search by status" do
      visit tasks_path
      expect(page).to have_content 'high'
    end
    scenario "Test search by both title and status" do
      visit tasks_path
      expect(page).to have_content 'test'
      expect(page).to have_content 'done'
    end
  
end